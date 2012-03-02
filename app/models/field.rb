require 'prawn/measurement_extensions'

class Field < ActiveRecord::Base
  belongs_to :page

  def eps_width
    convert_pixels_to_inchs(width.to_f).send(:in).round
  end

  def eps_height
    convert_pixels_to_inchs(height.to_f).send(:in).round
  end

  # TODO: the position is not correct
  def eps_position
    canvas_height = page.page.height.to_f

    eps_x = convert_pixels_to_inchs(pos_x.to_f).send(:in).round
    eps_y = (canvas_height - convert_pixels_to_inchs(pos_y.to_f).send(:in)).round

    [eps_x, eps_y]
  end

  private

    # prawn dpi is defaulted 
    def convert_pixels_to_inchs(pixels)
      pixels / 96
    end

end