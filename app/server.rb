require 'sinatra'
require 'json'
require 'rest-client'

require_relative './lib/user.rb'


class Fileww < Sinatra::Application

	enable :sessions
	set :session_secret, '123456546346'


	get '/' do
	  erb :index
	end

	post '/session' do
	email, password = params[:email], params[:password]
	response = RestClient.post 'https://my.workshare.com/api/v1.1/user_sessions.json', {user_session:{email: email, password: password}, device:{app_uid: ENV['WORKSHARE_API_KEY']}}
	end
end