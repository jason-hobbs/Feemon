class AddColumnToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :published, :datetime
  end
end
