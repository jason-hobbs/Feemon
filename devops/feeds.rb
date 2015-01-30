require "feedjira"
require "date"
require "pg"
require "active_support/all"
require 'action_view'

conn = PG.connect(
        :dbname => 'feemon',
        :user => 'test',
        :password => 'test')

conn.prepare("insert_entry", "insert into entries (title, description, link, feed_id, published, created_at, updated_at) values ($1, $2, $3, $4, $5, $6, $7)")
conn.prepare("update_feed_time", "update feeds set updated_at = $1, prevupdate = $2 where id = $3")
conn.prepare("get_entry_title", "select count(*) from entries where feed_id = $1 and title = $2")
conn.prepare("insert", "insert into entries (title, description, link, feed_id, published, created_at, updated_at) select $1, $2, $3, $4, $5, $6, $7 from entries where not exists (select 1 from entries where link = $3) limit 1")

conn.exec( "SELECT title,id,url,updated_at FROM feeds" ) do |result|
  result.each do |url|
    feedid = url["id"]
    feedtitle = url["title"]
    lastupdated = url["updated_at"]
    time = Time.now.utc
    puts "current time: #{time}"
    puts "#{url["id"]}: #{url["url"]}"
    feed = Feedjira::Feed.fetch_and_parse url["url"]
    count=0
    unless feed == 200 || feed.nil? || feed == 500
      feed.entries.each do |entry|
        if entry.content
          desc=entry.content
        else
          desc=entry.summary
        end
        if feedtitle == 'CNN'
          if desc
            desc = ActionView::Base.full_sanitizer.sanitize(desc)
          end
        end
        if feedtitle == 'Joystiq' || feedtitle == 'Engadget'
          if desc
            #desc.gsub!("/> ", "/> <br>")
            desc.gsub!(".png\"/>", ".png\"/><br>")
            desc.gsub!(".jpg\"/>", ".jpg\"/><br>")
            desc.gsub!(".gif\"/>", ".gif\"/><br>")
            desc.gsub!(".jpeg\"/>", ".jpeg\"/><br>")
            desc = desc.slice(0..(desc.index('><img src="http://feeds.feedburner.com/~ff/weblogsinc/')))
          end
        end
        if feedtitle == 'OMGUbuntu'
          if desc
            desc.gsub!("\" />", "\"/> <br>")
          end
        end
        if feedtitle == 'Kotaku' || feedtitle == 'Gizmodo' || feedtitle == 'Lifehacker'
          if desc
            desc = desc.slice(0..(desc.index('>Read more...')))
          end
        end
        if feedtitle == 'Drudge Report'
          if desc
            desc = desc.slice(0..(desc.index('><div class="feedflare">')))
          end
        end
        unless entry.published
 	       entry.published = '19:00-01-01 00:00:00'
	      end
         if 1.day.ago.midnight < entry.published.to_s
          count+=1
          if feedid.to_i == 3
            pub = entry.published + count
          else
            pub = entry.published
          end
          if entry.title
            entry.title.gsub!("&#63;", "?")
          end
          if entry.title
            entry.title.gsub!("&amp;", "&")
          end
          if desc
            desc.gsub!("&amp;", "&")
          end
          if desc
            desc.gsub!("&#63;", "?")
          end
            testtitle = conn.exec_prepared("get_entry_title", [feedid.to_i, entry.title])
            if testtitle.getvalue(0,0).to_i < 1
              conn.exec_prepared("insert", [entry.title, desc, entry.url, feedid.to_i, pub, time, time])
            end
        end
      end
      conn.exec_prepared("update_feed_time", [time, lastupdated, feedid.to_i])
      puts "#{count} entries inserted"
      puts ""
    else
      puts "feed had an error: #{feed}"
	end
  end
end
conn.close
