# app/workers/test_worker.rb
class TestWorker
  include Sidekiq::Worker

  def perform(*args)
    # Log the arguments to help diagnose the issue
    Rails.logger.info("TestWorker.perform received arguments: #{args.inspect}")

    # Your existing logic here...
  end
end

