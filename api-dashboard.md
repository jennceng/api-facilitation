In this challenge, you will build an informational dashboard using Sinatra. The information for your dashboard will come from many sources, mainly Web APIs.

Build out features of your web dashboard utilizing **Behavior Driven Development (BDD)**. Features are described as user stories. Your job is to write the code to satisfy each of the user stories, starting with a test. See the `spec/features/location_spec.rb` and `spec/lib/geolocation_spec.rb` files for examples on how to get started.


## Learning Goals

* Reading API documentation
* Consuming _resources_ provided by Web APIs
* Writing test for interacting with external resources


## Core User Stories

```no-highlight
As a user
I want to see the local temperature
So that I can dress accordingly.
```

```no-highlight
As a user
I want to know what events are happening today
So that I can plan my evening.
```

```no-highlight
As a user
I want to see the latest news headlines
So that I can stay informed with current events.
```

## Non-core User Stories

```no-highlight
As a user
I want to see a list of movies playing near me
So that I can decide if I want to see a movie today.
```

```no-highlight
As a user
I want to see the from and subject lines from unread emails in my inbox
So that I can know if I have received an urgent email.
```

```no-highlight
As a user
I want to add an RSS feed
So that I can stay informed
```

## Getting Started

```bash
$ et get api-dashboard
$ cd api-dashboard
$ bundle
$ rspec spec
$ rackup
```

Visit [http://localhost:9292/](http://localhost:9292/) to see your personal dashboard.


## API Keys

Some APIs require that you register with them before using their service. After signing up and registering your application, you will receive an **API key** that uniquely identifies your application. You will need to send this key along with each HTTP request you make to the API. Depending on the API, you will need to put your key either in the URL, or the header of the HTTP request.

For example, the Weather Underground API expects the API key to be placed in of the path of the URL.

```ruby
require "json"
require "net/http"

key = "<YOUR_API_KEY>"
uri = URI("http://api.wunderground.com/api/#{key}/conditions/q/MA/Boston.json")
response = Net::HTTP.get_response(uri)
puts JSON.parse(response.body)
```

The NYTimes API expects the API key to be placed in the parameters of the URL (aka query string).

```ruby
require "json"
require "net/http"

key = "<YOUR_API_KEY>"
uri = URI("http://api.nytimes.com/svc/topstories/v1/technology.json?api-key=#{key}")
response = Net::HTTP.get_response(uri)
puts JSON.parse(response.body)
```

To communicate with [api.data.gov](https://api.data.gov/docs/api-key/), we can include the API key in the header of the request.

```ruby
require "json"
require "net/http"

uri = URI("http://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json")
params = { location: "Boston MA" }
uri.query = URI.encode_www_form(params)

get = Net::HTTP::Get.new(uri)
get["X-Api-Key"] = "<YOUR_API_KEY>"

response = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(get)
end

puts JSON.parse(response.body)
```

[MDN - Understanding URLs and their structure](https://developer.mozilla.org/en-US/Learn/Understanding_URLs)

## Keeping API Keys a Secret

Since API keys are unique to your application, you **should not** make them public information for the world to see. This becomes especially important when you pay for a service, and the API key is tied to a credit card.

To that end, **we need to ensure that API keys stay out of our version control system** (git and GitHub). We do this by storing our API keys in [environment variables](http://ruby-doc.org/core/ENV.html). The steps to this process are as follows.

1. Add `.env` to the `.gitignore` file
2. Create a `.env` file: `$ touch .env`
3. Place all of your API keys in the `.env` file:

  ```no-highlight
  WUNDERGROUND_API_KEY="abc123"
  NYTIMES_API_KEY="xyz123"
  ```

4. Add `dotenv` to your `Gemfile` and `$ bundle`.
5. Require `dotenv` and load in your API keys.

  ```ruby
  require 'dotenv'
  Dotenv.load
  ```

6. Retrieve keys from the environment:

```ruby
key = ENV["NYTIMES_API_KEY"]
```

## Selected APIs

The [Programmable Web](http://www.programmableweb.com/) is a good resource for finding APIs.

### Weather

* [DarkSky](https://developer.forecast.io/docs/v2)
* [Weather Underground](http://www.wunderground.com/weather/api/d/docs)
* [OpenWeatherMap](http://openweathermap.org/api)

### News

* [NYTimes Top Stories](http://developer.nytimes.com/docs/top_stories_api/)
* [reddit](https://www.reddit.com/dev/api)

### Events and Entertainment

* [SeatGeek](http://platform.seatgeek.com/)
* [gracenote OnConnect](http://developer.tmsapi.com/docs/read/data_v1_1/movies/Movie_showtimes)

### Technology

* [Hacker News](https://github.com/HackerNews/API)
* [StackExchange](https://api.stackexchange.com/docs)
* [GitHub](https://developer.github.com/v3/)
