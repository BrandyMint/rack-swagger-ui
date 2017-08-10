require 'erb'

module Rack
  module Swagger
    module Ui
      class Controller
        class << self
          def call(env)
            @env = env

            ['200', { 'Content-Type' => 'text/html' }, view]
          end

          def view
            [ERB.new(template).result(binding)]
          end

          def template
            @template ||= ::File.open("#{Rack::Swagger::Ui.root}/lib/rack-swagger-ui/views/swagger.html.erb", 'r').read
          end

          def request
            @request ||= Rack::Request.new(@env)
          end
        end
      end
    end
  end
end
