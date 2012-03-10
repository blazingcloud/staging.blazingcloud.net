# app.rb
require 'sinatra'
require 'httparty'
require 'ostruct'
require 'stringio'
get '/' do
  html = StringIO.new
  HTTParty.get('http://blazingcloud.net/feed/json').each do |article|
    html << erb(:article, :locals => {:article => OpenStruct.new(article)})
  end
  html.string
end
