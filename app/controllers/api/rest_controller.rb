require 'sinatra'

get '/get_users' do
  'Hello world!'
end

get 'api/get_users' do
  'Hello world 2!'
end