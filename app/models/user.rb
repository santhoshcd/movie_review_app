class User < ApplicationRecord
	belongs_to :role
	has_many :reviews
	has_many :users, through: :reviews

	def self.from_omniauth(auth)
		user = User.find_by_provider_and_uid(auth.provider, auth.uid)
		if user.blank?
			user = User.new
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
		return user    
	end

	def is_admin?
		self.role.name == 'admin'
	end

end
