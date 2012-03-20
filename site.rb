# encoding: UTF-8
require 'sinatra/base'
class Site < Sinatra::Base
  before '*' do
    @title = "Blazing Cloud | Mobile Product Development"
  end
  get '/' do
    erb(:homepage)
  end
  get '/service' do
    redirect to('/services')
  end
  get '/services' do
    erb(:services)
  end
end
