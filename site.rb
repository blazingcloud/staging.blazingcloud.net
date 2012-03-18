# encoding: UTF-8
require 'sinatra/base'
class Site < Sinatra::Base
  get '/' do
    erb(:homepage)
  end
  get '/service' do
    erb(:service)
  end
  get '/services' do
    erb(:services)
  end
end
