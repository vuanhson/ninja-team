class UsersController < ApplicationController
  before_action :authenticate_user!
  include EmojiHelper

  def show
    if User.exists?(id: params[:id])
      @user = User.find(params[:id])
      @posts = @user.posts.order("created_at desc").limit(5)
      @post = Post.new
    end

  end

  def feed

  end

  def edit

    if (current_user == @user)
  	 @user = current_user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      @posts = @user.posts.order("created_at desc").limit(5)
      @post = Post.new
      render 'show'
    else
      render 'edit'
    end
  end
  private

    def user_params
      params.require(:user).permit(:user_name, :email, :password,
                                   :password_confirmation, :avatar)
    end
    def post_params
      params.require(:post).permit(:user_id, :content, :file)
    end
end

