class AddDefaultToFeeds < ActiveRecord::Migration
  def change
  	change_column :feeds, :prevupdate, :datetime, :default => "1900-01-01 00:00:00"
  end
end
