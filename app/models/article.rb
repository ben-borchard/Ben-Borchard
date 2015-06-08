class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	
	mount_uploader :picture, PictureUploader

	validates :title, presence: true,
					  length: { minimum: 5 }
	validate :picture_size

	def picture_size 
		if picture.size > 5.megabytes
			errors.add(:picture, 'should be less than 5MB')
		end
	end

end
