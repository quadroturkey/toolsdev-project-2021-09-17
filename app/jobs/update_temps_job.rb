class UpdateTempsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "running the job"
  end
end
