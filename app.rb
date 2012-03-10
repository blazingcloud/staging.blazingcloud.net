# app.rb
require 'sinatra'
require 'httparty'
require 'ostruct'
require 'stringio'
get '/' do
  articles = StringIO.new
  HTTParty.get('http://blazingcloud.net/feed/json').each do |article|
    articles << erb(:article, :locals => {:article => OpenStruct.new(article)})
  end
  erb(:index, :locals => {:articles => articles.string})
end
