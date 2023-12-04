# config/application.rb
require_relative "boot"
require 'rails/all'
require 'redis'

Bundler.require(*Rails.groups.reject { |group| group.in?(%w[assets]) })

module Care4self
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end

    config.load_defaults 7.1

    # Configure Redis cache store
    config.cache_store = :redis_cache_store, {
      url: ENV["REDIS_URL"] || "redis://localhost:6379/0/cache"
    }

    # Configure Redis connection with SSL verification bypass
    redis_url = "redis://:pe6dc62d20a26571050f70100b305e6f39b07d11b6e3c23394a3b0ee15a496c4f@ec2-63-34-38-39.eu-west-1.compute.amazonaws.com:26589"
    redis = Redis.new(url: redis_url, ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })

    config.redis = { url: ENV.fetch("REDISCLOUD_URL") { "redis://localhost:6379/0" }, ssl_params: { ca_file: "/etc/ssl/cert.pem" } }


    # Configure autoload paths
    config.autoload_paths += %W(#{config.root}/app/notifications)

    # Time zone configuration
    config.time_zone = 'Abu Dhabi'


config.active_record.default_timezone = :utc
config.active_record.time_zone_aware_attributes = true

  end
end
