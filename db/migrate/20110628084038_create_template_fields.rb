class CreateTemplateFields < ActiveRecord::Migration
  def self.up
    create_table :template_fields do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :template_fields
  end
end
