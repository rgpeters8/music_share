require 'sinatra'

class RestController < Sinatra::Base
  get '/get_users' do
    'Hello world!'
  end
end

