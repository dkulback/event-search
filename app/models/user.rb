class User < ApplicationRecord
  validates :login, :email, presence: true
  validates_presence_of :password, require: true
  validates_uniqueness_of :login, :email, case_sensitive: false
  has_secure_password
end
