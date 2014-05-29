class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true,                   
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }
  has_many :userfeeds, dependent: :destroy
  has_many :feeds, through: :userfeeds
  has_many :dashboards, dependent: :destroy

  def gravatar_id
  	Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email, password)
  	user = User.find_by(email: email)
  	user && user.authenticate(password)
  end
end
