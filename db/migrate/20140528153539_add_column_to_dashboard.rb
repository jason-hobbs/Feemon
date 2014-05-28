class AddColumnToDashboard < ActiveRecord::Migration
  def change
    add_column :dashboards, :entry_title, :text
  end
end
