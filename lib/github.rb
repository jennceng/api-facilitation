require "net/http"
require "json"

class Github
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def avatar_url
    get_info["avatar_url"]
  end

  def account_type
    get_info["type"]
  end

  def subscriptions_url
    get_info["subscriptions_url"]
  end

  private

  def get_info
    @account_data ||= JSON.parse(info_body)
  end

  def info_body
    binding.pry
    Net::HTTP.get_response(uri).body
  end

  def uri
    URI("https://api.github.com/users/#{@username}")
  end

end
