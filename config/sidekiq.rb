Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0', namespace: 'sidekiq', pool_size: 5 }
  config.average_scheduled_poll_interval = 15 # seconds
  config.time_zone = 'Port louis'
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0', namespace: 'sidekiq', pool_size: 5 }
  config.time_zone = 'Port louis'
end
