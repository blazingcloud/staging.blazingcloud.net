# encoding: UTF-8
require 'sinatra/base'
class Site < Sinatra::Base
  def rewrite_if_www
    if request.host =~ %r(^www\.)
      new_host = request.host_with_port.sub(/^www\./,'')
      redirect "#{request.scheme}://#{new_host}#{request.path}"
    end
  end
  before '*' do
    rewrite_if_www
  end  
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
  get '/blog' do
    redirect "http://blog.blazingcloud.net", "you found our blog!"
  end
  get '/*' do
    path = params[:splat].join
    redirect "http://blog.blazingcloud.net/#{path}", "you found our blog!"
  end
end


