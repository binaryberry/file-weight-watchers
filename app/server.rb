require 'sinatra'

app_uid = ENV['WORKSHARE_API_KEY']

get '/' do
  'Hello workshare!'
end