require "pg"
require "active_support/all"

conn = PG.connect(
        :host => 'ec2-54-204-40-96.compute-1.amazonaws.com',
        :dbname => 'd8mb17g883jqhh',
        :user => 'zwqaqdrugekjys',
        :password => 'AKhWFcOHMwL3C14gXO-xG-Ld0l')

conn.prepare("get_user_feeds", "select feed_id from userfeeds where user_id = $1")
conn.prepare("get_user_feeds_count", "select count(*) from userfeeds where user_id = $1")
conn.prepare("get_prev_update", "select prevupdate from feeds where id = $1")
conn.prepare("get_entry_ids", "select id,title,published,link from entries where feed_id = $1 and published > $2")
conn.prepare("update_dashboard", "insert into dashboards (user_id, feed_id, entry_id, entry_title, entry_published) values ($1, $2, $3, $4, $5)")
conn.prepare("update", "insert into dashboards (user_id, feed_id, entry_id, entry_title, entry_published, entry_link) select $1, $2, $3, $4, $5, $6 from dashboards where not exists (select 1 from dashboards where entry_link = $6 and user_id = $1) limit 1")


conn.exec( "SELECT id, lastvisit FROM users" ) do |result|
  result.each do |user|
  	userid = user["id"]
    #puts "user id: #{userid}"
  	res = conn.exec_prepared("get_user_feeds_count", [userid.to_i] ).values
  	res.each do |row|
      @counts = row[0]
    end
  	if @counts.to_i > 0
      conn.exec_prepared( "get_user_feeds", [userid.to_i] ) do |eachfeed|
      	eachfeed.each do |feed|
          eachfeedid = feed["feed_id"]
          #puts "     Feed id: #{eachfeedid}"
          #conn.exec_prepared( "get_prev_update", [eachfeedid.to_i] ) do |prevfeed|
          #  prevfeed.each do |prevtime|
          #    @last_updated = prevtime["prevupdate"]
          #  end
          @last_updated = 1.day.ago.midnight
          #end
          conn.exec_prepared( "get_entry_ids", [eachfeedid.to_i, @last_updated] ) do |entries|
          	entries.each do |entry|
          	  entryid = entry["id"]
              entrytitle = entry["title"]
              entrypublished = entry["published"]
              entrylink = entry["link"]
              #puts "          Entry id: #{entryid}"
              #conn.exec_prepared( "update_dashboard", [userid.to_i, eachfeedid.to_i, entryid.to_i, entrytitle, entrypublished] )
              conn.exec_prepared( "update", [userid.to_i, eachfeedid.to_i, entryid.to_i, entrytitle, entrypublished, entrylink] )
            end
          end
        end
      end
    end
  end
end
