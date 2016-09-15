require 'turnout'
require 'rack/turnout'
require 'rails'

# For Rails 3
if defined? Rails::Engine
  module Turnout
    class Engine < Rails::Engine
      initializer 'turnout.add_to_middleware_stack' do |app|
        before = Turnout.config.insert_middleware_before
        if before
          app.config.middleware.insert_before before, Rack::Turnout
        else
          app.config.middleware.use Rack::Turnout
        end
      end
    end
  end
end
