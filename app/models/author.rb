class Author < ActiveRecord::Base
  attr_accessible :login, :name

  has_many :lesson_plans
end
