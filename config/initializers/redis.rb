url = ENV["redis://default:oE5JupWrojIFHXeIr1O2fV7URUi8WSK6@redis-10704.c1.eu-west-1-3.ec2.cloud.redislabs.com:10704"]

if url
  # Assuming REDISCLOUD_URL is in the format: rediss://:your-password@hostname:port
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end

  $redis = Redis.new(url: url)
else

  $redis = Redis.new(url: 'redis://localhost:6379/0')

  Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0' }
  end
end
