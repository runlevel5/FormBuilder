require 'prawn/measurement_extensions'

class Field < ActiveRecord::Base
  belongs_to :page

  # convert pixels to cm to dot
  def set_eps_coordinate
    canvas_width = convert_pixels_to_cms(page.page.width.to_f).cm
    canvas_height = convert_pixels_to_cms(page.page.height.to_f).cm

    self.eps_width  = convert_pixels_to_cms(width.to_f).cm.round
    self.eps_height = convert_pixels_to_cms(height.to_f).cm.round

    self.eps_x = convert_pixels_to_cms(pos_x.to_f).cm.round
    self.eps_y = (canvas_height - convert_pixels_to_cms(pos_y.to_f).cm).round

    self.save
  end

  private

    def convert_pixels_to_cms(pixels, dpi = Rails.configuration.pdf_to_png_dpi)
      (pixels / dpi) * 2.54
    end

end