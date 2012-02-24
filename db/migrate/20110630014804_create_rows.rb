class CreateRows < ActiveRecord::Migration
  def self.up
    create_table :rows do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :rows
  end
end
