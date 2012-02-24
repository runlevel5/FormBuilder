class CreatePapersizes < ActiveRecord::Migration
  def self.up
    create_table :papersizes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :papersizes
  end
end
