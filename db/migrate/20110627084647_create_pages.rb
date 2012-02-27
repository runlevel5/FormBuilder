class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :template_id, :null => false
      t.string  :name
      t.text    :page_meta
      t.has_attached_file :page
    end

    add_index :pages, :template_id
  end
end
