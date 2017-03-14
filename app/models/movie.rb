class Movie < ApplicationRecord
	has_many :reviews
	has_attached_file :poster, styles: { medium: "300x400#" }
	validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/
end
