require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(10.minutes, 'Queueing interval job') { Delayed::Job.enqueue 'feeds_heroku.rb' }
every(10.minutes, 'Queueing interval job') { Delayed::Job.enqueue 'feeds_user_heroku.rb' }
every(1.hour, 'Queueing interval job') { Delayed::Job.enqueue 'topstories_heroku.rb' }
every(1.day, 'Queueing interval job') { Delayed::Job.enqueue 'clean_heroku.rb' }
