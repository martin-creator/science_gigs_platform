class AddWalletToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :wallet, :float, default: 0
  end
end
