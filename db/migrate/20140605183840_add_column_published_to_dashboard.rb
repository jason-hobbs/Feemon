class AddColumnPublishedToDashboard < ActiveRecord::Migration
  def change
    add_column :dashboards, :entry_published, :datetime
  end
end
