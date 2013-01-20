class LessonPlanRating < Rating
  attr_accessible :rater_id, :rated_id, :rating

  belongs_to :rated, class_name: 'LessonPlan'
end