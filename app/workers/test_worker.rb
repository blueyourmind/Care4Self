# app/workers/test_worker.rb
class TestWorker
  include Sidekiq::Worker

  def perform(*args)
    # Your worker logic here
    puts "TestWorker performing with arguments: #{args.inspect}"

    # Additional logic can be added based on your requirements
  end
end
