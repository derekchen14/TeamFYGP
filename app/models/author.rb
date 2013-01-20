class Author < ActiveRecord::Base
  attr_accessible :login, :name

  has_many :lesson_plans
  has_many :comments

######################################
#
# Methods having to do with Ratings
#
######################################

  def author_ratings_given
    Rating.where(rater_id: id).where(type: 'AuthorRating')
  end

  def lesson_plan_ratings_given
    Rating.where(rater_id: id).where(type: 'LessonPlanRating')
  end

  def ratings
    Rating.where(rated_id: id)
  end
end
