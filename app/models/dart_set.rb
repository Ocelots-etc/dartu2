class DartSet < ActiveRecord::Base
  belongs_to :user
  has_many :darts
  validates_presence_of :name, :user
end
