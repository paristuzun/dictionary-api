class User < ActiveRecord::Base
  has_many :topics
  has_many :entries
  has_many :votes

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}

  def admin?
		self.role.to_s.to_sym == :admin
	end
end
