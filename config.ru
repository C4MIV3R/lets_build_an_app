require './helpers/colorize'

require './app'

require './models/account'
require './models/comment'
require './models/photo'
require './models/another'
require './models/something'

run Sinatra::Application

c = Colorize.new

before '/*' do
  c.log(:red, '------------------------')
  c.log(:red, 'Request recieved by server')
  c.log(:yellow, 'Host: '+ request.host + request.path)
  c.log(:yellow, 'Params: '+params.to_s)
  c.log(:red, '------------------------')
end

after '/*' do
  c.log(:cyan, '------------------------')
  c.log(:cyan, 'Request sent from server')
  c.log(:aqua, 'Stauts: '+ response.status.to_s)
  c.log(:aqua, 'Response: '+ response.body.to_s)
  c.log(:cyan, '------------------------')
end
# allow static files to be put in /public and hosted at localhost/*
set :public_folder, File.dirname(__FILE__) + '/public'
# set folder for templates to ../views, but make the path absolute
set :views, File.dirname(__FILE__) + '/views'
c.log(:red, "Johnny Five feels aliiiiiiiive.")
