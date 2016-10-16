Yt.configure do |config|
  config.client_id = '757826175150-i5b9tb0pahuci7j6akn90rc6at35e4j3.apps.googleusercontent.com'#ENV['YT_CLIENT_ID']
  config.client_secret = 'XLtQcoRTN-QgKR_uhbXhmQvQ'#ENV['YT_CLIENT_SECRET']
  config.api_key = 'AIzaSyAEbqBiAh-aRQ9Iuys_7Pr1_3GJWRn8RF8'#ENV['YT_KEY']
end

AlchemyAPI.configure do |config|
  config.apikey = "3ed17274821b28eb3561d54921c087294a151dd5"
  config.output_mode = :json # not yet supported
end
