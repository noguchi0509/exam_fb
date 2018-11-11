class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
    
  def new
    @post = Post.new
  end
  
  def confirm
    @post = Post.new(post_params)
    if @post.valid?
        render 'confirm'
    end
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
        redirect_to posts_path, notice:"投稿しました！"
    else
        render 'confirm'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:"削除しました"
  end
  
  private
  
  def post_params
      params.require(:post).permit(:text, :image, :image_cache)
  end
   
end
