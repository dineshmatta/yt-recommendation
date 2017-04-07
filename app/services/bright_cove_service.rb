require 'rest-client'
require 'openssl'
require 'base64'
require 'oauth2'

class BrightCoveService

  ACCOUNT_ID = '4679196299001'

  BASE_ENDPOINT = 'https://cms.api.brightcove.com/v1/accounts/'+ACCOUNT_ID+'/videos'

  ACCESS_TOKEN_URL = 'https://oauth.brightcove.com/v3/access_token'

  def initialize()
    RestClient.log = 'stdout'
    @url = BASE_ENDPOINT
    @access_token_url = ACCESS_TOKEN_URL
  end

  def search_videos(keywords)
    access_token = get_access_token
    escaped_keywords = URI.escape(keywords, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    video_response = fetch_videos(access_token, escaped_keywords)
    video_ids = get_video_ids(video_response)
  end

  private

  def fetch_videos(access_token, query)

    begin
      ## Make API call to brightCov 
      response = RestClient::Request.execute( method: :get, 
                                              url: formate_url_with_query_string(query), 
                                              headers: {
                                                          Authorization:  'Bearer '+access_token,
                                                          accept: :json
                                                       }
                                            )

      response_body = JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end

  end

  def get_access_token
    encodedData = 'Basic ' + Base64.strict_encode64(configatron.clientId + ':' + configatron.secret)
    begin
      ## Make API call to brightCov 
      response = RestClient::Request.execute( method: :post, 
                                              url: @access_token_url, 
                                              payload: get_request_body,
                                              headers: {
                                                          Authorization:  encodedData,
                                                          content_type: 'application/x-www-form-urlencoded'
                                                       }
                                            )

      response_body = JSON.parse(response.body)
      access_token = response_body["access_token"]
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  def formate_url_with_query_string(query)
    @url + '?q='+ query
  end

  def get_request_body
    'grant_type=client_credentials'
  end

  def get_video_ids(response)
    response.collect { |video| video["id"] }
  end
end