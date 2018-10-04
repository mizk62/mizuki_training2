class LikesController < ApplicationController

  def create
   @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
   @like.save
   redirect_to posts_path
   @posts = Post.all
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    redirect_to posts_path
  end

  # def create
  #   @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
  #   @likes = Like.where(post_id: params[:post_id])
  #   @posts = Post.all
  # end
  #
  # def destroy
  #   like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
  #   like.destroy
  #   @likes = Like.where(post_id: params[:post_id])
  #   @posts = post.all
  # end
end
