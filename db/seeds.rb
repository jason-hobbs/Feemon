# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:name=>'Taylor Hobbs', :email=>'taylor@feemon.com', :password=>'Testing1', :admin=>true)
User.create(:name=>'grimmstede', :email=>'grimmstede@feemon.com', :password=>'Testing1', :admin=>true)
User.create(:name=>'Test User', :email=>'test@test.com', :password=>'Testing1', :admin=>false)
Feed.create(:title=>'Arstechnica', :site=>'www.arstechnica.com', :url=>'feeds.arstechnica.com/arstechnica/BAaf', :created_at=>'1900-01-01 00:00:00', :updated_at=>'1900-01-01 00:00:00')
Feed.create(:title=>'Desctructoid', :site=>'www.destructoid.com', :url=>'feeds.feedburner.com/Destructoid', :created_at=>'1900-01-01 00:00:00', :updated_at=>'1900-01-01 00:00:00')
Feed.create(:title=>'Drudge Report', :site=>'www.drudgereport.com', :url=>'www.drudgereportfeed.com/rss.xml', :created_at=>'1900-01-01 00:00:00', :updated_at=>'1900-01-01 00:00:00')
Feed.create(:title=>'Kotaku', :site=>'www.kotaku.com', :url=>'feeds.gawker.com/kotaku/full', :created_at=>'1900-01-01 00:00:00', :updated_at=>'1900-01-01 00:00:00')
Feed.create(:title=>'Lifehacker', :site=>'www.lifehacker.com', :url=>'feeds.gawker.com/lifehacker/full', :created_at=>'1900-01-01 00:00:00', :updated_at=>'1900-01-01 00:00:00')
Feed.create(:title=>'Noobs Lab', :site=>'www.noobslab.com', :url=>'www.noobslab.com/feeds/posts/default?max-results=10', :created_at=>'1900-01-01 00:00:00', :updated_at=>'1900-01-01 00:00:00')