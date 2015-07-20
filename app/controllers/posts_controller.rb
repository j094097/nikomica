class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :set_self_post, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.published.all

    @posts = current_user.posts if params[:user_id].present?
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = current_user.posts.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)

    @post.save

    redirect_to user_posts_path(current_user)
  end

  def update
    @post.update(post_params)
    redirect_to user_posts_path(current_user)
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(current_user)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def set_self_post
      @post = current_user.posts.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:post_date, :content, :published)
    end
end
