module SpreeBacGateway
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_bac_gateway'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end



    config.autoload_paths += %W(#{config.root}/lib)
    #config.autoload_paths << "#{Rails.root}/lib"


    initializer "spree.gateway.payment_methods", :after => "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::Gateway::BAC
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
