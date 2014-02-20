require 'sinatra'

get 'hello_world' do
  "Hello!"
end

get 'api/hello_world' do
  "Hello api!"
end
