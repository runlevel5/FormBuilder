class Page < ActiveRecord::Base
  belongs_to :template
  has_many :fields
  after_save :calculate_field_eps_coordinate

  has_attached_file :page, :styles => { :thumb => "100x100>" }

  accepts_nested_attributes_for :fields, :allow_destroy => true

  private

    # if we use after_save callback on field model to update eps coordinate
    # we'll bump into stack level too deep issue of calling callbacks
    # on associated object using accepts_nested_attributes
    # A work around is to loop through each field in page model
    def calculate_field_eps_coordinate
      fields.each(&:set_eps_coordinate) 
    end
end
