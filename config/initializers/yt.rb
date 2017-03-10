Yt.configure do |config|
  config.client_id = '953503381443-5tu5259born5k2q08qqvhvj4506krdpn.apps.googleusercontent.com'#ENV['YT_CLIENT_ID']
  config.client_secret = 'gAEoKEsgXZweK0AgILXIEScJ'#ENV['YT_CLIENT_SECRET']
  config.api_key = 'AIzaSyDzPRK2t3x8gYYbYdhaja7tDr85CnF26nE'#ENV['YT_KEY']
end

AlchemyAPI.configure do |config|
  config.apikey = "ad0128d092d08fcb49ae98e22963e8c3341c9ce7"
  config.output_mode = :json # not yet supported
end
