require 'sinatra'
require 'songkick/oauth2/provider'
Songkick::OAuth2::Provider.realm = 'Fileww'

app_uid = ENV['WORKSHARE_API_KEY']

class Fileww < Sinatra::Application

	enable :sessions
	set :session_secret, 'super secret'


	get '/' do
	  erb :index
	end

	post '/session' do
			erb :"sessions/new"
			# email, password = params[:email], params[:password]
			# user = User.authenticate(email, password)
			# if user
			# 	session[:user_id] = user.id
			# 	redirect to('/')
			# else
			# 	flash[:errors] = ["The email or password is incorrect"]
			# end
	end
end