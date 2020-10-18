class Dart < ActiveRecord::Base
  belongs_to :dart_set
  validates_presence_of :name, :dart_set
end
