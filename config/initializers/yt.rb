Yt.configure do |config|
  config.client_id = '953503381443-5tu5259born5k2q08qqvhvj4506krdpn.apps.googleusercontent.com'#ENV['YT_CLIENT_ID']
  config.client_secret = 'gAEoKEsgXZweK0AgILXIEScJ'#ENV['YT_CLIENT_SECRET']
  config.api_key = 'AIzaSyDzPRK2t3x8gYYbYdhaja7tDr85CnF26nE'#ENV['YT_KEY']
end

AlchemyAPI.configure do |config|
  config.apikey = "1bac5f4ef1e22ee88fa6eadee3f85fe81ec45967"
  config.output_mode = :json # not yet supported
end
