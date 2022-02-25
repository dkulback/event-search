class User < ApplicationRecord
  validates :login, :email, presence: true
  validates_uniqueness_of :login, :email, case_sensitive: false
end
