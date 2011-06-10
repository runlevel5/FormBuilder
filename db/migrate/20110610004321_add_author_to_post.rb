class AddAuthorToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :author, :string, :default => 'Anonymous'
  end

  def self.down
    remove_column :posts, :author
  end
end
