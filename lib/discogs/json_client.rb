class JSONClient
  def initialize(root_url)
    @root_url = root_url
  end

  def get(path, params = {})
    response = connection.get path, params do |request|
      request.headers['Content-Type'] = 'application/json'
    end
    response.body
  end

  def authenticate(auth_type, auth_content)
    @authentication = [auth_type, auth_content]
  end

  private

  def connection
    @connection ||= Faraday.new(@root_url) do |f|
      f.request :json # encode req bodies as JSON and automatically set the Content-Type header
      # f.request :retry # retry transient failures
      f.response :json # decode response bodies as JSON
      f.adapter :net_http # adds the adapter to the connection, defaults to `Faraday.default_adapter`
      f.headers['Authorization'] = @authentication.first, @authentication.last if @authentication
    end
  end
end
