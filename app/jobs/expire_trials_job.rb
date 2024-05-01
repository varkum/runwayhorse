class ExpireTrialsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    
    # Find trials that end tomorrow and send an email
    Trial.where(started_on: 4.days.ago).find_each do |trial|
      TransactionMailer.with(user: trial.trip.user, trip: trial.trip).trial_almost_done.deliver_now
    end
    
    # Find trials that have ended and expire them
    Trial.where("started_on < ?", 5.days.ago).find_each do |trial|
      TransactionMailer.with(user: trial.trip.user, trip: trial.trip).trial_done.deliver_now
      trial.destroy!
    end
  end
end
