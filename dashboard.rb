require "./lib/github"
require "sinatra/base"

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  get("/") do
    @github = Github.new("jennceng")

    erb :dashboard
  end
end
