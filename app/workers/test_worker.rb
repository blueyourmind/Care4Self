# app/workers/test_worker.rb
class TestWorker
  include Sidekiq::Worker

  def perform
    # Your job logic here
  end
end
