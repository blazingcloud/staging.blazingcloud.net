# encoding: UTF-8
require 'sinatra/base'
class Site < Sinatra::Base
  before '*' do
    @title = "Blazing Cloud | Mobile Product Development"
  end
  get '/' do
    @pagename = 'home'
    erb(:homepage)
  end
  get '/service' do
    redirect to('/services')
  end
  get '/services' do
    @pagename = 'services'
    erb(:services)
  end
  get '/*' do
    path = params[:splat].join
    redirect "http://blog.blazingcloud.net/#{path}", "you found our blog!"
  end
end


