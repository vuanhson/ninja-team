class Post < ApplicationRecord
	mount_uploader :file, ImageUploader
	belongs_to :user
	has_many :tags
end
