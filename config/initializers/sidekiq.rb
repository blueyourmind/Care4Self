url = ENV["rediss://default:oE5JupWrojIFHXeIr1O2fV7URUi8WSK6@redis-10704.c1.eu-west-1-3.ec2.cloud.redislabs.com:10704"]

if url
  redis_options = { url: url }

  # Parse the URL to extract the password (if present)
  uri = URI.parse(url)
  redis_options[:password] = uri.password if uri.password

  Sidekiq.configure_server do |config|
    config.redis = redis_options
  end

  Sidekiq.configure_client do |config|
    config.redis = redis_options
  end

  $redis = Redis.new(redis_options)
else
  # Fallback to local Redis server if REDISCLOUD_URL is not present
  redis_options = { url: 'redis://localhost:6379/0' }

  Sidekiq.configure_server do |config|
    config.redis = redis_options
  end

  $redis = Redis.new(redis_options)
end
