require "pg"
require "active_support/all"

conn = PG.connect(
        :dbname => 'feemon',
        :user => 'test',
        :password => 'test')

conn.prepare("clean_entries", "delete from entries where published < $1")
conn.prepare("clean_dashboards", "delete from dashboards where entry_published < $1")
conn.exec_prepared("clean_entries", [14.days.ago.midnight])
conn.exec_prepared("clean_dashboards", [14.days.ago.midnight])
