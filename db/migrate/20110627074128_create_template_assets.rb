class CreateTemplateAssets < ActiveRecord::Migration
  def self.up
    create_table :template_assets do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :template_assets
  end
end
