class AddDefaultToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :lastvisit, :datetime, :default => "1900-01-01 00:00:00"
  end
end
