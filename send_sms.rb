require 'rubygems'
require 'twilio-ruby'


account_sid = ""
auth_token = ""

@client = Twilio::REST::Client.new account_sid, auth_token

from = "+14024034837"

friends = {  
  "+14024907554" => "Me"
}

friends.each do |key, value|
  @client.account.messages.create(
  :from => from,
  :to => key,
  :body => "hey #{value}, twilio says hi"
  )
  puts "send message to #{value}"
end
