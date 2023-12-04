# config/environments/production.rb

require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.action_mailer.default_url_options = { host: "www.care4self.pro" }

  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Enable static file serving from the `/public` folder (turn off if using NGINX/Apache for it).
  config.public_file_server.enabled = true

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Log to STDOUT by default
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Info include generic and useful information about system operation, but avoids logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII). If you
  # want to log everything, set the level to "debug".
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Use a different cache store in production.
  config.cache_store = :redis_cache_store, ENV["REDIS_URL"] || "redis://default:oE5JupWrojIFHXeIr1O2fV7URUi8WSK6@redis-10704.c1.eu-west-1-3.ec2.cloud.redislabs.com:10704/0/cache"

  config.redis = {
    url: ENV.fetch("REDIS_URL") { "redis://default:oE5JupWrojIFHXeIr1O2fV7URUi8WSK6@redis-10704.c1.eu-west-1-3.ec2.cloud.redislabs.com:10704" }
    # ssl_params: { ca_file: "/etc/ssl/cert.pem" } # Uncomment this line if Redis Cloud requires SSL
  }

  # ... rest of your configuration

  config.action_mailer.perform_caching = false
  config.active_job.queue_adapter = :sidekiq

  config.i18n.fallbacks = true

  # Do not log any deprecations.
  config.active_support.report_deprecations = false

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
  config.action_cable.url = "wss://www.care4self.pro/cable"
  config.action_cable.allowed_request_origins = [ 'https://www.care4self.pro' ]

  # config.hosts = [
  #   "www.care4self.pro", # Allow requests from your domain
  #   /.*\.care4self\.pro/ # Allow requests from subdomains like `api.care4self.pro`
  # ]
end
