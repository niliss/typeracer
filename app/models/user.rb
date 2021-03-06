class User < ActiveRecord::Base
	has_many :scores
  def self.from_omniauth(auth)
    puts auth
    puts auth.info.image
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.image = auth.info.image
      puts user.image
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save

    end
  end
end
