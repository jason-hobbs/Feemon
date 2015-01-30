require "feedjira"
require "date"
require "pg"
require "active_support/all"

conn = PG.connect(
        :dbname => 'feemon',
        :user => 'test',
        :password => 'test')

conn.prepare("insert_entry", "insert into topstories (entry_id) values ($1)")

conn.exec("delete from topstories")
conn.exec( "SELECT title,id,url,updated_at FROM feeds" ) do |result|
  result.each do |url|
    if url["title"] == 'Engadget' || url["title"] == 'Arstechnica' || url["title"] == 'U.S. News' || url["title"] == 'Polygon' || url["title"] == 'Fox News' || url["title"] == 'Joystiq' || url["title"] == 'The Verge' || url["title"] == 'Gizmodo' || url["title"] == 'Lifehacker'

      feedid = url["id"]
      conn.exec( "SELECT id FROM entries where feed_id = #{feedid} order by id desc limit 1" ) do |entry|
        entry.each do |story|
          conn.exec_prepared("insert_entry", [story["id"]])
        end
      end
    end
  end
end
conn.close
