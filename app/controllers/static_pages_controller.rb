class StaticPagesController < ApplicationController
	before_action :authenticate_user!

	def home
		@post = Post.new
		following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = #{current_user.id}"
    	
		if params[:id]
			@posts = Post.where("(user_id IN (#{following_ids})OR user_id = #{current_user.id}) AND created_at < '#{params[:id]}'	").order("created_at desc").limit(5)	
	    else
	      @posts = Post.where("user_id IN (#{following_ids})OR user_id = #{current_user.id}").order("created_at desc").limit(5)  
	    end    	
    	respond_to do |format|
	      format.html
    	  format.js
    	end
	end

	def search
		@users = User.where("user_name LIKE '%#{search_params[:content]}%'")
		@posts = Post.where("con`tent LIKE '%#{search_params[:content]}%'")
	end


	def preset_avatar
		if current_user.sign_in_count > 1
			redirect_to root_path
		end
	end

	def preset_user_infor
		
	end

	def find_friend
		
	end

	private
	    def search_params
	    	params.require(:search).permit(:content)
	    end

	    def avatar_params
	    	params.require(:user).permit(:avatar)	
	    end

end