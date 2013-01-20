class Rating < ActiveRecord::Base
  attr_accessible :author_id, :lesson_plan_id, :rating

  belongs_to :author
  belongs_to :lesson_plan

end