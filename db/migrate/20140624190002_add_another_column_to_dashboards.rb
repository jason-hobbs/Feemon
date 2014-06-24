class AddAnotherColumnToDashboards < ActiveRecord::Migration
  def change
    add_column :dashboards, :entry_link, :text
  end
end
