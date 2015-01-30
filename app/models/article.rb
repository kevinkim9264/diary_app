class Article < ActiveRecord::Base
	validates :title, presence: true,
					  length: { minimum: 5 }

	validates :text, presence: true,
					 length: { in: 0..200 }
end
