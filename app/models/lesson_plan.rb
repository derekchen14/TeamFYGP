class LessonPlan < ActiveRecord::Base
  attr_accessible :content, :difficulty, :grade, :length, :subject, :tags
end
