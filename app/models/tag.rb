class Tag < ActiveRecord::Base
  attr_accessible :lesson_plan_id, :name
  belongs_to :lesson_plan
end
