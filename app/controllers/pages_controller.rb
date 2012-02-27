class PagesController < ApplicationController
  before_filter :load_page, :only => [:design, :update]

  def design
    @pages = @template.pages
  end

  def update
    if @page.update_attributes(params[:page])
      flash[:notice] = "Update #{@page.name} successfully"
    else
      flash[:error] = "Failed updating #{@page.name}"
    end

    redirect_to design_template_page_path(@template, @page)    
  end

  private

    def load_page
      @template = Template.find(params[:template_id])
      @page = Page.find(params[:id])
    end
end