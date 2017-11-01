class PostsController < ApplicationController
  before_action :require_author, only: %i(destroy)

  def create
    post = Post.new(post_params)
    post.author_id = current_user.id
    if post.save
      redirect_to subs_url
    else
      flash.now[:errors] = post.errors.full_messages
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = post.errors.full_messages
      render :edit
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
    redirect_to sub_url()
  end

  def require_author
    target_post = Post.find(params[:id])
    return false unless current_user && target_post
    current_user.posts.include?(target_post)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
