class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_one_attached :avatar

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    if user
      if !user.provider
        user.update(uid: auth.uid, provider: auth.provider, image: auth.info.image)
      end
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20] # this creates a random password
        user.full_name = auth.info.name   # assuming the user model has a name
        user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        user.uid = auth.uid
        user.provider = auth.provider

        #user.skip_confirmation!

      end
    end
  end

  # def hidden_phone
  #   if self.phone && self.phone.length > 3
  #     "*" * (self.phone.length - 3) + self.phone.last(3)
  #   end
  # end
end

# def self.from_omniauth(access_token)
# data = access_token.info
# user = User.where(email: data['email']).first

# # Uncomment the section below if you want users to be created if they don't exist
# unless user
#     user = User.create(name: data['name'],
#        email: data['email'],
#        password: Devise.friendly_token[0,20]
#     )
# end
# user
# end
