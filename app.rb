require 'bundler'
require 'sinatra'
Bundler.require

enable :sessions

ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :database => 'build_an_app'
)

@header_message    = ""
@is_user_logged_in = false

not_found do
  erb :notfound
end

get '/' do
  erb :index
end

get '/account_home' do
  @header_message = "Welcome"
  erb :account_home
end

get '/account_update' do
  @header_message = "Updating your account? Okay, let me pull up your file."
  erb :account_update
end

get '/login_register' do
  @header_message = "Welcome back. Please enter your security credentials."
  erb :login_register
end
