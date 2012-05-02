require 'sinatra/base'
require 'twilio-ruby'
class Incoming < Sinatra::Base
  def to_numbers
    {'14156326001' => 'Curtis',
     '15102207769' => 'Judy'   }.keys
  end
  def send_deploy_messages(*things)
    account_sid = ENV['DEPLOY_TWILIO_ACCOUNTSID']
    auth_token  = ENV['DEPLOY_TWILIO_AUTHTOKEN']
    from_phone  = '15102207769' # JUDY's Verified Number #  Question: must this be a verified number?
    @client ||= Twilio::REST::Client.new(account_sid,auth_token)

    to_numbers.each do |to_number|
      @client.account.sms.messages.create(
        :from => from_phone,
        :to => to_number,
        :body => "[Depot][Incoming::Deploy] #{things.join(' | ')}"
      )
    end

  end

  post '/deploy/:service' do

    param_string = params.inject("") do |memo,kv|
      memo += "<div><span>#{kv.first}</span> => <span>#{kv.last}</span></div>"
    end


    send_deploy_messages(params[:app], params[:url])

    "Incoming :: /deploy/#{params[:service]} :: #{param_string }"


  end
end
