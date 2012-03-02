class Page < ActiveRecord::Base
  belongs_to :template
  has_many :fields

  has_attached_file :page, :styles => { :thumb => "100x100>" }

  accepts_nested_attributes_for :fields, :allow_destroy => true
end
