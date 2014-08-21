class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :description
      t.string :link
      t.references :feeds, index: true

      t.timestamps
    end
  end
end
