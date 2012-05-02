require 'sinatra/base'
class Incoming < Sinatra::Base
  post '/deploy/:service' do

    param_string = params.inject("") do |memo,kv|
      memo += "<div><span>#{kv.first}</span> => <span>#{kv.last}</span></div>"
    end
    "Incoming :: /deploy/#{params[:service]} :: #{param_string }"
  end
end
