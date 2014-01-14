class User < ActiveRecord::Base

  has_many :trips
  has_many :feed_sources
  has_many :photos
  has_many :statuses
  validates :name, :presence => true

  def possessive_name
    name.ends_with?("s") ? name + "'" : name + "'s"
  end

  def self.from_omniauth(auth)
    user = User.find_or_create_by(
      uid:      auth["uid"],
      provider: auth["provider"]
      )

    user.update_attributes(
      name:          auth["info"]["nickname"],
      avatar_url:    auth["info"]["image"],
      access_token:  auth.extra.access_token.token,
      access_secret: auth.extra.access_token.secret
      )

    user
  end
end
