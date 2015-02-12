class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	

	#validates :user, presence: true

	validates :title, presence: true,
					  length: { minimum: 5 }

	validates :text, presence: true,
					 length: { in: 1..200 }
end
