class AddColumnPrevupdateToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :prevupdate, :datetime
  end
end
