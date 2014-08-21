class AddLasttimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :lastvisit, :datetime
  end
end
