require 'clockwork'
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end

  every(10.minutes, 'feeds.rb')
  every(10.minutes, 'feeds_user.rb')
  every(1.hour, 'topstories.rb')
  every(1.day, 'clean.rb')
end
