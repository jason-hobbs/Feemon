class CreateTopstories < ActiveRecord::Migration
  def change
    create_table :topstories do |t|
      t.references :entry, index: true

      t.timestamps
    end
  end
end
