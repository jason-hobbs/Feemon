require "feedjira"
require "date"
require "pg"

conn = PG.connect(
        :dbname => 'feemon',
        :user => 'root',
        :password => 'naginata')

conn.prepare("insert_entry", "insert into entries (title, description, link, feed_id, published, created_at, updated_at) values ($1, $2, $3, $4, $5, $6, $7)")
conn.prepare("update_feed_time", "update feeds set updated_at = $1 where id = $2")

conn.exec( "SELECT id,url,updated_at FROM feeds" ) do |result|
  result.each do |url|  
    feedid = url["id"]
    lastupdated = url["updated_at"]
    time = Time.now.utc
    puts "current time: #{time}" 
    puts "#{url["id"]}: #{url["url"]}"            
    feed = Feedjira::Feed.fetch_and_parse url["url"]
    count=0    
    if feed != 200
      feed.entries.each do |entry|        
        if entry.content
          desc=entry.content
        else
          desc=entry.summary
        end           
        #puts "last updated: #{lastupdated} -- entry published: #{entry.published.to_s}"	
        #puts "lastupdated: #{lastupdated.class} --- entry.published: #{entry.published.class}"
        if lastupdated < entry.published.to_s
          count+=1          
          conn.exec_prepared("insert_entry", [entry.title, desc, entry.url, feedid.to_i, entry.published, time, time])      
        end      
      end
      conn.exec_prepared("update_feed_time", [time, feedid.to_i])
      puts "#{count} entries inserted"
      puts ""
    else
      puts "feed had an error: #{feed}"  
	end
  end  
end
conn.close