class Image < ApplicationRecord
	mount_uploader :file, ImageUploader

	belongs_to :user
	validates_size_of :file, maximum: 1.megabytes, message: "Should be less than 1MB"
end
