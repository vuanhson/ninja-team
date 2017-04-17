class UsersController < ApplicationController
  def show  	  
    @user = User.find(params[:id])
  	@posts = @user.posts.order("created_at desc")
    @post = Post.new  
  end

  def edit
    if (current_user.id == params[:id])
  	 @user = User.find(current_user.id)
    end
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
    def post_params
      params.require(:post).permit(:user_id, :content, :file)
    end
end
