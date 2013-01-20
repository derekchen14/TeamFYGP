class LessonPlan < ActiveRecord::Base
  attr_accessible :author_id, :description, :grade, :name, :subject

  belongs_to :author
  has_many :tags
  has_many :comments
  has_many :ratings

end
