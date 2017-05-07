class TagsController < ApplicationController
	before_action :set_tag, only: :destroy

	def create
		Tag.create user_id: params[:user_id], post_id: params[:post_id]
		respond_to do |format|
			format.json{}
		end
	end

	def delete
		Tag.destroy user_id: params[user_id], post_id: params[post_id]
	end
	
	private 
	def set_tag
		@tag = Tag.find_by params[:id]
	end
end
