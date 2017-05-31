class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def new
    @posts = Post.new
  end

  def show
    @posts = Post.find(params[:id])
  end

  def create
    @posts = Post.new(post_params)
    if @posts.save
      # got a new record in the db
      redirect_to post_path(@posts)
    else
      # Something went wrong, have user fix errors on the form and show page again
      render :new
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to root_path
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def update
    @posts = Post.find(params[:id])
    if @posts.update(post_params)
      redirect_to post_path(@posts)
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :author, :body)
    end
end
