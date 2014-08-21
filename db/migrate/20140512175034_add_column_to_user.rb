class AddColumnToUser < ActiveRecord::Migration
  def change
    add_reference :users, :feed, index: true
  end
end
