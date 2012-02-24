class CreateTemplatePages < ActiveRecord::Migration
  def self.up
    create_table :template_pages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :template_pages
  end
end
