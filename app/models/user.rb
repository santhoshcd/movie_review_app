class User < ApplicationRecord
	belongs_to :role
	has_many :reviews
	has_many :users, through: :reviews
	before_create :set_default_role

	def self.from_omniauth(auth)
	    where(auth.slice(provider: auth.provider, uid: auth.uid)).first_or_initialize.tap do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.email = auth.info.email
	      user.image_path = auth.info.image
	      user.oauth_token = auth.credentials.token
	      user.role ||= Role.find_by_name('customers')
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      user.save!
	    end
	end

	private
		def set_default_role
		  self.role ||= Role.find_by_name('customers')
		end

end
