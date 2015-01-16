require 'sinatra'

app_uid = ENV['WORKSHARE_API_KEY']

enable :sessions
set :session_secret, 'super secret'

get '/' do
  erb :index
end

post '/sessions' do
		email, password = params[:email], params[:password]
		user = User.authenticate(email, password)
		if user
			session[:user_id] = user.id
			redirect to('/')
		# else
		# 	flash[:errors] = ["The email or password is incorrect"]
		end
end