class DocumentController < ApplicationController

  skip_before_filter :verify_authenticity_token


  def generate
    pos_x = params[:pos_x]
    pos_y = params[:pos_y]
    width = params[:width]
    height = params[:height]
    page_id = params[:page_id]
    font = params[:font]
    size = params[:size]
    color = params[:color]
    grid = params[:grid]
    max_rows = params[:max_rows]
    borders = params[:borders]
    align = params[:align]    
    template_asset_id = params[:template_asset_id]
    paper_size = params[:paper_size]
    landscape = params[:landscape]

    #get template pages
    template_page = TemplatePage.find(:first, :conditions => {"id" => page_id})

    res = TemplateField.find(:all, :conditions => ["template_page_id = #{page_id}"])
    res.each do |r|
      r.destroy
    end

    i = 0
    if !pos_x.nil?
      pos_x.each do |f|
        #canvas
        canvas_x = 1000
        canvas_y = (canvas_x / (template_page.width.to_f / template_page.height.to_i)).ceil

        #calculate eps coordinates
        eps_x = ((pos_x[i].to_f / canvas_x) * template_page.width).round
        eps_y = ((pos_y[i].to_f / canvas_y) * template_page.height).round
        eps_w = ((width[i].to_f / canvas_x) * template_page.width).round
        eps_h = (((height[i].to_f + 1)/ canvas_x) * template_page.width).round # adjust the height 0.5

        field = TemplateField.new
        field.template_asset_id = template_asset_id[i]
        field.pos_x = pos_x[i]
        field.pos_y = pos_y[i]
        field.width = eps_w
        field.height = eps_h
        field.template_page_id = page_id
        field.eps_x = eps_x
        field.eps_y = template_page.height - eps_y - 8 #adjust the y values
        field.font = font[i]
        field.color = color[i]
        field.size = size[i]
        field.grid = grid[i]
        field.align = align[i]
        field.num_rows = max_rows[i]
        field.borders = (!borders.nil?)? borders[i] : ""
        field.save

        i += 1
      end
    end

    # generate the pdf
    #find the template page
    tp = TemplatePage.find(:first, :conditions =>  {:id => page_id})

    #create document template
    #RGhost::Config::GS[:path]= 'C:\\Program Files (x86)\\gs\\gs9.05\\bin\\gswin32c.exe'
    landscape = (landscape == "1")? true:false
    paper_size = (paper_size.blank?)? "a4" : paper_size
    
    doc = RGhost::Document.new :paper => paper_size.to_sym, :landscape => landscape,  :margin => [0, 0, 0, 0]
    doc.define_template(:template, tp.eps_location, :x=> 0, :y => 0)

    #find All Fields
    tfs = TemplateField.find(:all, :include => "template_asset",  :conditions => {"template_page_id" => tp.id})

    #any grid??
    dynamic_field = TemplateField.find(:first, :include => "template_asset",  :conditions => {"template_page_id" => tp.id, "template_assets.asset_type_id" => 3})

    
    
    values = Array.new
    num_rows = 2
    num_page = 1

    #set variable for grid
    if !dynamic_field.nil?
      num_rows = (dynamic_field.num_rows.nil?) ? 10 : dynamic_field.num_rows.to_i
      eval(dynamic_field.template_asset.content)
      num_page = (values.length == 0)? 1 : (values.length / num_rows.to_f).ceil
    end

    
    #defining the tags
    doc.define_tags do
      tfs.each do |tf|
        font = (tf.font.empty?)? "Helvetica" : "#{tf.font}"
        size = (tf.size.empty?)? "12" : "#{tf.size}"
        color = (tf.color.empty?)? "black" : "#{tf.color}"
        tag "tag#{tf.id}".to_sym, :name => font, :size => size.to_i, :color => color.to_sym
      end
    end


    # start rendering 
    p = 0
    row = 0
    while p < num_page
      #define the template to use
      doc.use_template :template
      
      #show static fields
      tfs.each do |tf|
        if tf.template_asset.asset_type_id == 1
          alignment = (tf.align == "")? "left" : tf.align
          doc.text_area  "<tag#{tf.id}>" +tf.template_asset.content + "</tag#{tf.id}>", :text_align => :left, :width => "#{tf.width}", :x => "#{tf.eps_x}", :y => "#{tf.eps_y}", :text_align => alignment.to_sym
        end
      end

      #dynamic fields
      tfs.each do |tf|
        if tf.template_asset.asset_type_id == 2
          value = ""
          eval(tf.template_asset.content)
          alignment = (tf.align == "")? "left" : tf.align
          doc.text_area  "<tag#{tf.id}>" + value.to_s + "</tag#{tf.id}>", :text_align => :left, :width => "#{tf.width}", :x => "#{tf.eps_x}", :y => "#{tf.eps_y}",  :text_align => alignment.to_sym
        end
      end

      #show grid
      if !dynamic_field.nil?
        grids = dynamic_field.grid.split(",").sort
        y = dynamic_field.eps_y.to_i

        i = 0
        while i < num_rows && row < values.length
          #display one row
          g = 0
          for e in values[row]
            x = (dynamic_field.eps_x.to_i + (grids[g].to_i / 100.0) * dynamic_field.width.to_i).floor
            next_x = (grids[g+1].nil?) ? (dynamic_field.eps_x.to_i + dynamic_field.width.to_i) : (dynamic_field.eps_x.to_i + (grids[g+1].to_i / 100.0) * dynamic_field.width.to_i).floor
            width = next_x - x
            size = (dynamic_field.size.empty?)? 12 : dynamic_field.size.to_i
            color = (dynamic_field.color.empty?)? "black" : "#{dynamic_field.color}"
            alignment = (dynamic_field.align == "")? "left" : dynamic_field.align

            #render the values
            doc.text_area  "<tag#{dynamic_field.id}>" + e.to_s + "</tag#{dynamic_field.id}>", :text_align => :left, :width => "#{width}", :x => "#{x}", :y => "#{y}", :row_height => "#{dynamic_field.height.to_i}", :text_align => alignment.to_sym

            #render border?
            if dynamic_field.borders == 1
              doc.frame :x => "#{x}", :y => "#{y-dynamic_field.height.to_i+size}", :width => "#{width}", :height => "#{dynamic_field.height.to_i}", :content => {:fill => false}, :border => {:color => color.to_sym, :width => 1}
            end
            g += 1
          end

          #next row
          y = y - dynamic_field.height.to_i
          i += 1
          row += 1
        end
      end

      if p + 1 < num_page
        doc.next_page
      end
      
      p += 1
    end


    #render the documents
    doc.render :pdf, :filename => tp.eps_location + ".pdf"
    #send_data doc.render_stream(:pdf), :filename =>  tp.eps_location + ".pdf"
    @returned_file = File.basename(tp.eps_location) + ".pdf"
    render :action => "generate", :layout => false
  end



  def index
    @papersize = Papersize.find(:all)
    render :action => 'index'
  end


  def choose
    id = params[:id]
    @pages = TemplatePage.find(:all)
    if id.present?
      @page = TemplatePage.find(:first, :conditions => {:id => id})
      @tmpt = Template.find(:first, :conditions => {:id => @page.template_id})
    end
    @papersizes = Papersize.find(:all)
    render :action => "choose", :layout => false
  end

  def design
    @assets = TemplateAsset.find(:all)
    @pages = TemplatePage.find(:all)
    @color = Color.find(:all)
    @font = Font.find(:all)
    @size = Size.find(:all)
    @row = Row.find(:all)
    @align = Alignment.find(:all)
    render :action => 'design'
  end




  def save
    #RGhost config
    #RGhost::Config::GS[:path]= 'C:\\Program Files (x86)\\gs\\gs9.05\\bin\\gswin32c.exe'
    landscape = (params[:landscape] == "1")? 1:0;
    papersize = (params[:papersize].blank?)? "a4":params[:papersize];


    
    #get and save file
    filename = params[:upload][:file].original_filename

    #santize filename
    filename = filename.gsub /^.*(\\|\/)/, ''
    filename = filename.gsub(/[^0-9A-Za-z.\-]/, '_')



    name = filename.sub('.pdf', '')
    template_dir = File.join(RAILS_ROOT, "public/template")
    path = File.join(template_dir, name + '.pdf')
    File.open(path, "wb") { |f| f.write(params[:upload][:file].read)}

    #store in database
    res = Template.find(:all, :conditions => {:name => name})
    if res.length > 0
      for r in res
        pages = TemplatePage.find(:all, :conditions => {:template_id => r.id})
        for p in pages
          fields = TemplateField.find(:all, :conditions => {:template_page_id => p.id})
          for f in fields
            f.destroy
          end
          p.destroy
        end
        r.destroy
      end
    end

    @t = Template.new
    @t.name = name
    @t.location = path
    @t.paper_size = papersize
    @t.landscape = landscape
    @t.save

    
    #convert pdf to eps and png
    eps = RGhost::Convert.new(path).to :eps, :multipage => true, :filename => path.sub(".pdf", ".eps")
    png = RGhost::Convert.new(path).to :png, :multipage => true, :filename => path.sub(".pdf", ".png")
    
    if png
      #save eps/png files
      i = 0
      png.each do |p|
        sizes = Array.new
        image_size = nil
        open(p, "rb") do |f|
          image_size = ImageSize.new(f.read)
        end
        
        tp = TemplatePage.new
        tp.template_id = @t.id
        tp.name = File.basename(p)
        tp.png_location = p
        tp.eps_location = eps[i]
        tp.width = image_size.width
        tp.height = image_size.height
        tp.save
        i = i + 1
      end
    else
      flash[:error] = 'conversion failed'
    end


    redirect_to :action => :design
  end


end
