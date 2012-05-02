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
    from_phone  = '14157994519' # JUDY's TWILO Internal Number 
    @client ||= Twilio::REST::Client.new(account_sid,auth_token)
      puts @client
    puts "9" * 70
    # grab an account instance resource if you know the sid
    @account = @client.accounts.get(account_sid)
    # http round trip happens here
    puts @account.friendly_name

    puts "9" * 70

    puts "1" * 70
    to_numbers.each do |to_number|
    puts "2" * 70
      puts @client.account.sms.messages.create(
        :from => from_phone,
        :to => to_number,
        :body => "[Depot][Incoming::Deploy] #{things.join(' | ')}"
      )
    end
    puts "3" * 70

  end

  post '/deploy/:service' do
    puts "0" * 70

    param_string = params.inject("") do |memo,kv|
      memo += "<div><span>#{kv.first}</span> => <span>#{kv.last}</span></div>"
    end

    puts 'depot'
    send_deploy_messages(params[:app], params[:url])
    puts params
    "Incoming :: /deploy/#{params[:service]} :: #{param_string }"
  end
end
