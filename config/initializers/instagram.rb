Instagram.configure do |config|
  config.client_id = ENV['INST_CLIENT_ID']
  config.client_secret = ENV['INST_CLIENT_SECRET']
  config.access_token = ENV['INST_ACCESS_TOKEN']
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end