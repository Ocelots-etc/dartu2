class User < ActiveRecord::Base
  has_secure_password
  has_many :dart_sets
  has_many :darts, through: :dart_sets
  validates_uniqueness_of :username
end
