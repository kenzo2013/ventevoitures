class User < ActiveRecord::Base
  ROLES = %w[admin simple_user]
  validates :firsname, presence: true
  validates :surname, presence: true
  has_secure_password
end
