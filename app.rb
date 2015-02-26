$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sinatra'
require 'barge'

post '/restartserver' do
  @barge = Barge::Client.new(access_token: ENV['DIGITAL_OCEAN_KEY'])
  show_help if params['text'].nil? or params['text'].empty?
end

def show_help
  response = ":bangbang: No server selected. Choose one of these... \n"
  @barge.droplet.all.response.body.droplets.each do |droplet|
    response << "- `/restartserver #{ droplet.id }` for #{ droplet.name } \n"
  end

  response
end
