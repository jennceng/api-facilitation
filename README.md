### Credit to Juice’s consuming/test APIs with Rails: [https://github.com/justinhuynh/api\_clinic](https://github.com/justinhuynh/api_clinic)

Consuming APIs
--------------

Many many ways to make HTTP requests to an API, outside of our application we can get the same data by doing:

```ruby
$ curl https://api.github.com/users/jennceng
```

We can make a get request by simply going to the url in the browser

```ruby
https://api.github.com/users/jennceng
```

To mimic how our application is going to assemble our HTTP get request, we can also:

```ruby
pry
require 'HTTParty'
HTTParty.get("https://api.github.com/users/jennceng")
```



**What is HTTParty doing for us?**

Basically, we are just visiting a website using Ruby, and then doing stuff with the output. To access a website in Ruby, we need to use an HTTP client.

HTTP clients allow us to GET (and POST or otherwise interact with) info from external websites. There are a number of HTTP clients out there that wrap Ruby's native [`Net:HTTP` library](http://ruby-doc.org/stdlib-2.3.1/libdoc/net/http/rdoc/Net/HTTP.html).

---

VCR
### Real HTTP Request to Fake HTTP Service

[VCR](https://github.com/vcr/vcr) is a gem that intercepts any outgoing HTTP requests from our app (in test) and returns a fake HTTP response that is stored in a YAML file (`cassette`).

1. Add VCR and webmock to your `Gemfile`

2. Create a file `spec/support/vcr.rb` and add the following configuration info:

```rb
require "vcr"

VCR.configure do |c|
c.cassette_library_dir = "spec/vcr_cassettes"
c.hook_into :webmock
c.ignore_localhost = true
c.configure_rspec_metadata!
c.default_cassette_options = { record: :new_episodes }
c.allow_http_connections_when_no_cassette = false
end
```

`record: :new_episodes` makes a real HTTP request the first time, and saves it into a `.yml` file ("cassette"), with a name that you specify (see test example below).

3. Now you are ready to add VCR to specific tests. Let's see an example in the spec folder:



All you need to do is add `vcr: { cassette_name: "file_name_here" }` after the quote in your `describe` statement. This is a hash, and the `vcr:` statement signifies that you want to use VCR for the enclosed tests.
