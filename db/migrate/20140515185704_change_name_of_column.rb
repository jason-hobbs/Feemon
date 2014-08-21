class ChangeNameOfColumn < ActiveRecord::Migration
  def change
    rename_column :entries, :feeds_id, :feed_id
  end
end
