class PostsController < ApplicationController
#before_action :authenticate_user #, {only: [:new, :create, :edit, :update, :destroy]}
#before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: 'desc')
    @like = Like.new() 
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    #save
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save!

    #redirect
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :img, :user_id, :username)
    end
end
