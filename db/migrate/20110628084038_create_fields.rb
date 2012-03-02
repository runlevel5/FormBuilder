class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :page_id, :null => false
      t.integer :pos_x
      t.integer :pos_y
      t.integer :width
      t.integer :height
      t.text :value

      t.timestamps
    end

    add_index :fields, :page_id
  end
end
