namespace :backfill do
  desc "add date fields to lodging"
  task add_date: :environment do
    Lodging.reset_callbacks(:save)
    Lodging.reset_callbacks(:validate)
    Lodging.reset_callbacks(:create)
    Lodging.reset_callbacks(:update)
    
    Lodging.find_each do |lodging|
      start_date = lodging.days.first&.date
      end_date = lodging.days.last&.date
      lodging.update_column(:start_date, start_date)
      lodging.update_column(:start_date, end_date)
      print "."
    end
    
    puts "\nBackfill done"
  end
end
