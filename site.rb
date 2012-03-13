# encoding: UTF-8
require 'sinatra/base'
class Site < Sinatra::Base
  get '/' do
    erb(:service)
  end
end
