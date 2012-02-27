class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string  :name

      t.has_attached_file :template

      t.timestamps
    end
  end
end
