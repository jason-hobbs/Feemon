class ChangeTitleInEntries < ActiveRecord::Migration
  def change
  	change_column :entries, :title, :text
  	change_column :entries, :link, :text
  end
end
