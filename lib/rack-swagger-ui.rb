require 'rack-swagger-ui/version'
require 'rack-swagger-ui/controller'

module Rack
  module Swagger
    module Ui
      def self.root
        ::File.dirname(__dir__)
      end
    end
  end
end
