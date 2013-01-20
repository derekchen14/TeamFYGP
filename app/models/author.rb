class Author < ActiveRecord::Base
  attr_accessible :login, :name

  has_many :lesson_plans
  has_many :comments
  has_many :ratings

end
