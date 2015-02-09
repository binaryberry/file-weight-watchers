require 'sinatra'
require 'json'
require 'rest_client'
require 'sinatra/partial'
require 'rack-flash'
require 'sinatra/cookies'
require 'pry'
require 'json'

require_relative 'lib/user.rb'
require_relative 'lib/filelist.rb'


class Fileww < Sinatra::Application

	enable :sessions
	set :session_secret, 'super secret'


	get '/' do
	  erb :index
	end

	post '/files' do
	user = User.new(params[:email], params[:password])
	user.login
	session[:email] = user.email
	session[:password] = user.password
	response.set_cookie "workshare_cookie", "#{user.my_cookie}"
	redirect to '/files'
	end
	
	get '/files' do	
	@user = User.new(session[:email], session[:password])
	@user.login
	my_cookie = eval(request.cookies["workshare_cookie"])
	metadata = @user.listfiles(my_cookie)
	@file_list = FileList.new(metadata)
	@file_list.total_weight
	erb :files
	end
end