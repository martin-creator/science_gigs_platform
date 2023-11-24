// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import jquery from "jquery"
import toastr from "toastr"
//import "toastr"

window.$ = window.jquery = jquery
window.toastr = toastr
