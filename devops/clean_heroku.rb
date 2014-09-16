require "pg"
require "active_support/all"

conn = PG.connect(
        :host => 'ec2-54-204-40-96.compute-1.amazonaws.com',
        :dbname => 'd8mb17g883jqhh',
        :user => 'zwqaqdrugekjys',
        :password => 'AKhWFcOHMwL3C14gXO-xG-Ld0l')

conn.prepare("clean_entries", "delete from entries where published < $1")
conn.prepare("clean_dashboards", "delete from dashboards where entry_published < $1")
conn.exec_prepared("clean_entries", [3.days.ago.midnight])
conn.exec_prepared("clean_dashboards", [3.days.ago.midnight])
