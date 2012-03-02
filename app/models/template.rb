class Template < ActiveRecord::Base
  has_many :pages, :dependent => :destroy

  validates :name, :presence => true

  has_attached_file :template
  validates_attachment_presence :template
  validates_attachment_content_type :template, :content_type => 'application/pdf', :message => 'Must be PDF format file'
  before_post_process :forbid_pdf # Disable Paperclip::Thumbnails post-processing for PDF

  after_save :create_template_pages

  def generate_pdf
    filename = File.join(template.path)
    pdf = Prawn::Document.new(:template => filename, :margin => 0) do |p|
      self.pages.each.with_index do |page, i|
        p.go_to_page(i+1)

        page.fields.each do |field|
          p.text_box field.value, :at => field.eps_position, :width => field.eps_width,
                                  :height => field.eps_height, :overflow => :shrink_to_fit

        end
      end
    end
    output_file = Rails.root.join('tmp', template_file_name) unless output_file
    pdf.render_file(output_file)
    output_file
  end

  private

    def forbid_pdf
      return false if (template_content_type =~ /application\/.*pdf/)
    end

    def create_template_pages
      return unless pages.count.zero?
      
      images = RGhost::Convert.new(template.path).to(:png, :multipage => true, :resolution => Rails.configuration.pdf_to_png_dpi, :filename => template.path.sub('.pdf', '.png'))

      if images
        images.each do |file|
          p = self.pages.new
          p.name = File.basename(file)
          p.page = File.new(file, 'r')
          p.save

          # Remove temp files after creation
          FileUtils.rm(file) rescue nil
        end
      end
    end
end
