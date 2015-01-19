require 'sinatra'
require 'json'
require 'rest-client'

require_relative './lib/user.rb'


class Fileww < Sinatra::Application

	enable :sessions
	set :session_secret, 'super secret'


	get '/' do
	  erb :index
	end

	post '/session' do
	app_uid = ENV['WORKSHARE_API_KEY']
	email, password = params[:email], params[:password]
	user = User.find_by_username(email, password)
	token = Songkick::OAuth2::Provider.access_token(user, ['files'], app_uid)
	
  	headers token.response_headers
  	status  token.response_status

  	if token.valid?
    	JSON.unparse('files' => user.files)
  	else
    	JSON.unparse('error' => 'No files for you!')
  	end
	end
end