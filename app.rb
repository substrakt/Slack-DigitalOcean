$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sinatra'
require 'barge'

post '/restartserver' do
  verify_token!(params[:token])
  @barge = Barge::Client.new(access_token: ENV['DIGITAL_OCEAN_KEY'])
  if params['text'].nil? or params['text'].empty?
    show_help
  else
    restart_server(params['text'].to_i)
  end
end

private

def show_help
  response = ":bangbang: No server selected. Choose one of these... \n"
  @barge.droplet.all.response.body.droplets.each do |droplet|
    response << "`/restartserver #{ droplet.id }` for #{ droplet.name } \n"
  end

  response
end

def restart_server(droplet_id)
  if @barge.droplet.power_cycle(droplet_id).success?
    "Restarting server #{ droplet_id } :clock2:"
  else
    "Failed to restart. :confused:"
  end
end

def verify_token!(token)
  halt(500) if !token.eql?(ENV['SLACK_TOKEN']) || token.blank?
end
  
