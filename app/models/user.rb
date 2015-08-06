class User < ActiveRecord::Base
  validates :firsname, presence: true
  validates :surname, presence: true
  has_secure_password
  ROLES = %w[admin simple_user]
end
