class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
    
  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end
  
  def confirm
    # @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    if @post.invalid?
        render 'new'
    end
  end
  
  def edit_confirm
    @post = Post.new(post_params)
    if @post.valid?
        render 'edit_confirm'
    end
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # @post = current_user.posts.build(post_params)
    if @post.save
        redirect_to posts_path, notice:"投稿しました！"
    else
        render 'confirm'
    end
  end
  
  def edit
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.find(params[:id])
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:"削除しました"
  end
  
  def update
    # @post = Post.find(params[:id])
    # @post.user_id = current_user.id
    @post = current_user.posts.build(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice:"編集しました！"
    else
      render 'edit'
    end
  end
  
  private
  
  def post_params
      params.require(:post).permit(:text, :image, :image_cache)
  end
end