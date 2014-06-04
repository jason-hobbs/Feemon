class ChangeReadForDashboard < ActiveRecord::Migration
  def change
  	change_column :dashboards, :read, :boolean, :default => "0"
  end
end
