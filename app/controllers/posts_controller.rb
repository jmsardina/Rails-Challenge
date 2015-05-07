class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @authors = Author.order(:last_name)
    @tags = Tag.order(:name)
    @post = Post.new
  end

  def create
    @authors = Author.all
    @tags = Tag.all
    @post = Post.new(post_params)

    if @post.save
      redirect_to(posts_path, notice: 'The post was saved.') and return
    else
      render :new, error: 'The post was not saved.'
    end
  end

  private
  def post_params
    params.require(:post).permit(:header, :subheader, :body, :author_id, :tag_ids => [])
  end
end
