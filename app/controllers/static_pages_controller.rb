class StaticPagesController < ApplicationController
	before_action :authenticate_user!

	def home
		@post = Post.new
		following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = #{current_user.id}"
    	@posts = Post.where("user_id IN (#{following_ids})OR user_id = #{current_user.id}")
	end

end