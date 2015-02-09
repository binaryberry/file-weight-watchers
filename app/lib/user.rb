require 'rest_client'
require 'json'
require 'sinatra/cookies'
require 'pry'

class User

 attr_accessor :email, :password, :my_cookie
 attr_reader :files_metadata

	def initialize email, password
		@email = email
		@password = password
	end

	def login
		response = RestClient.post 'https://my.workshare.com/api/v1.1/user_sessions.json', {user_session:{email: @email, password: @password}, device:{app_uid: ENV['WORKSHARE_API_KEY']}}
		@my_cookie = response.cookies
	end

	def listfiles(my_cookie)
		@files_metadata = RestClient.get 'https://my.workshare.com/api/open-v1.0/files.json', {cookies: my_cookie}		
	end


end