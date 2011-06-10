class PostsController < ApplicationController
  def new
    @post = Post.new
  end
 
# app/controllers/posts_controller.rb
# (just the create action)
  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:notice] = 'Your post was saved successfully.'
      redirect_to @post
    else
      render :action => 'new'
    end
  end


  def show
    @post = Post.find(params[:id])
  end


  def index
    @posts = Post.find(:all, :order => 'created_at DESC')
    sometask
  end

  def sometask
  
  end
  
end