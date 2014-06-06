class AddIndexToEntries < ActiveRecord::Migration
  def change    
    add_index :entries, :title, unique: true
  end
end
