require 'erb'

module Rack
  module Swagger
    module Ui
      class Controller
        # class << self
          def initialize(path)
            @path = path
          end

          def call(env)
            @env = env
            req = Rack::Request.new(env)
            if req.path_info == @path
              [200, { 'Content-Type' => 'text/html' }, view]
            else
              [404, {"Content-Type" => 'text/html'}, ['Not found']]
            end
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
        # end
      end
    end
  end
end
