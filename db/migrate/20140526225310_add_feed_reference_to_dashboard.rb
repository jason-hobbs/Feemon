class AddFeedReferenceToDashboard < ActiveRecord::Migration
  def change
    add_reference :dashboards, :feed, index: true
    add_reference :dashboards, :entry, index: true
    add_column :dashboards, :read, :boolean
  end
end
