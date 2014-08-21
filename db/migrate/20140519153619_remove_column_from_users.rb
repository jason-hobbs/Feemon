class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :feed_id, :integer
  end
end
