class Post < ApplicationRecord
	mount_uploader :file, ImageUploader
	belongs_to :user
	has_many :tags
	has_many :likes, :foreign_key => "post_id", :dependent => :destroy   
	
	has_many :liking_users, :through => :likes, :source => :user
	has_many :comments
end
