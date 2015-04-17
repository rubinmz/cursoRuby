class Pin < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates :description, presence: true
	validates_attachment :image,
						content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
						size: { less_than: 5.megabytes }


	belongs_to :user
	#actualizacion oja.la
	attr_accessible :user_id, :description, :image

	
end

