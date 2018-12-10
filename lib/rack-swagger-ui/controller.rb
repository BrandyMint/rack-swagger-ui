require 'erb'

module Rack
  module Swagger
    module Ui
      class Controller
          def initialize(discovery_url: '/swagger_doc', api_key: nil, validator_url: nil)
            @discovery_url = discovery_url
            @api_key = api_key
            @validator_url = validator_url
          end

          def call(env)
            [200, { 'Content-Type' => 'text/html' }, view]
          end

          private

          attr_reader :discovery_url, :validator_url, :api_key

          def view
            [ERB.new(template).result(binding)]
          end

          def template
            @template ||= ::File.open("#{Rack::Swagger::Ui.root}/lib/rack-swagger-ui/views/swagger.html.erb", 'r').read
          end
      end
    end
  end
end
