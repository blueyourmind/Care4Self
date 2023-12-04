require_relative "boot"
require 'redis'
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups.reject { |group| group.in?(%w[assets]) })


module Care4self
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    config.active_job.queue_adapter = :sidekiq
# config/application.rb

# ...

config.cache_store = :redis_cache_store, ENV["REDIS_URL"] || "redis://localhost:6379/0/cache"


# ...

    # Configure Redis with SSL verification bypass
    redis_url = "redis://:pe6dc62d20a26571050f70100b305e6f39b07d11b6e3c23394a3b0ee15a496c4f@ec2-63-34-38-39.eu-west-1.compute.amazonaws.com:26589"
    redis = Redis.new(url:"rediss://:pe6dc62d20a26571050f70100b305e6f39b07d11b6e3c23394a3b0ee15a496c4f@ec2-63-34-38-39.eu-west-1.compute.amazonaws.com:26589" , ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })

    # Set the Redis connection for your application
    config.redis = redis

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))
    # config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    config.autoload_paths += %W(#{config.root}/app/notifications)
# config/application.rb
# config.cache_store = :redis_store, ENV["REDIS_URL"] || "redis://localhost:6379/0/cache"


    # config.active_job.queue_adapter = :sidekiq

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.time_zone = 'Abu Dhabi'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false

  end

end
