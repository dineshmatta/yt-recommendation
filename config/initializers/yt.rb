Yt.configure do |config|
  config.client_id = '953503381443-5tu5259born5k2q08qqvhvj4506krdpn.apps.googleusercontent.com'#ENV['YT_CLIENT_ID']
  config.client_secret = 'gAEoKEsgXZweK0AgILXIEScJ'#ENV['YT_CLIENT_SECRET']
  config.api_key = 'AIzaSyDzPRK2t3x8gYYbYdhaja7tDr85CnF26nE'#ENV['YT_KEY']
end

AlchemyAPI.configure do |config|
  config.apikey = "3ed17274821b28eb3561d54921c087294a151dd5"
  config.output_mode = :json # not yet supported
end
