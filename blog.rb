# encoding: UTF-8
# blog.rb
require 'sinatra/base'
require 'httparty'
require 'ostruct'
require 'stringio'
class Blog < Sinatra::Base
  before '*' do
    @title = "Blazing Cloud | Blog"
  end

  get '/' do
    articles = StringIO.new
    HTTParty.get('http://blog.blazingcloud.net/feed/json').each do |article|
      articles << erb(:article, :locals => {:article => OpenStruct.new(article)},:layout => false)
    end
    erb(:blog, :locals => {:articles => articles.string})
  end
end
