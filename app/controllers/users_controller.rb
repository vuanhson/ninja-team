class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@user_posts = @user.posts
  	@posts = User.find(params[:id]).posts
    @post = Post.new
    @user = User.find(params[:id])
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      @posts = User.find(params[:id]).posts
      render 'show'
    else
      render 'edit'
    end
  end
  private

    def user_params
      params.require(:user).permit(:user_name, :email, :password,
                                   :password_confirmation)
    end
end
