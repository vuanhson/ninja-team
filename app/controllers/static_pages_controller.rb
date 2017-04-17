class StaticPagesController < ApplicationController
	def home
		@data = Post.all
	end

end