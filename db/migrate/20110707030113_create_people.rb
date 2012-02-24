class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.string :other_name
      t.integer :gender_id            
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
