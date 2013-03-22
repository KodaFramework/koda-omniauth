# Koda Authorisation OmniAuth
This is middleware for Koda Content that allows you to secure your server using OmniAuth

## Usage
You have to subclass Koda::Authorisation::OmniAuthIntegration and add in the strategies you require, so:

```ruby
class MyAuthStrategy < Koda::Authorisation::OmniAuthIntegration
  use ::OmniAuth::Strategies::GitHub, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET']
  set :views, 'path/to/views'
end
```

Then use it as middleware on your Koda::Api

```ruby
class MyApi < Koda::Api
  use MyAuthStrategy
end
```
