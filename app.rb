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

post '/login_register/create' do
  @new_account                = Account.new
  @new_account.username       = params[:username]
  @new_account.user_email     = params[:user_email]
  @new_account.password_hash  = params[:password_hash]
  @new_account.first_name     = params[:first_name]
  @new_account.last_name      = params[:last_name]
  @new_account.save
  @header_message = "Thank youuuuuu for loggggging in!"
  redirect '/account_home'
end

post '/login_register/login' do
  @all_users = Account.all
  @all_users.each do |user|
    p user.to_s
  end
  redirect '/'
end
