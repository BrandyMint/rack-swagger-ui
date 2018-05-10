Rack::Swagger::Ui
===============

Integrates [swagger-ui] with your "grapified" Rack application.

## Dependencies

* [grape-swagger]
> Add swagger compliant documentation to your grape API

* [grape]
> An opinionated micro-framework for creating REST-like APIs in Ruby

## Installation

Add this line to your application's Gemfile:

    gem 'rack-swagger-ui', github: 'adammartak/rack-swagger-ui'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-swagger-ui

## Usage example:

Configure your grape:

    class YourAPI < Grape::API
      version 'v1'
      format :json
      ...
      add_swagger_documentation :mount_path => '/swagger/swagger.json'
    end

Add middleware to your config.ru:

    require 'rack-swagger-ui'

    use Rack::Static,
      urls: ['/js', '/css', '/fonts', '/images'],
      root: File.join(Rack::Swagger::Ui.root, 'public')

    run Rack::Cascade.new([YourAPI.new,
                           Rack::Swagger::Ui::Controller.new('/swagger')])

*See https://github.com/ruby-grape/grape-swagger#configure for more configuration settings.*

The Swagger UI page will be located at

    http://host:port/swagger

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
MIT License, full text of license see [here][License]

[License]: https://github.com/adammartak/rack-swagger-ui/blob/master/LICENSE.txt "LICENSE"
[grape-swagger]: https://github.com/tim-vandecasteele/grape-swagger
[grape]: https://github.com/intridea/grape
[swagger-ui]: https://github.com/wordnik/swagger-ui/
