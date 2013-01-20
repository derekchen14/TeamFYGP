class Author < ActiveRecord::Base
  attr_accessible :login, :name

  has_many :lesson_plans
  has_many :comments
  has_many :ratings

  #returns the avg rating over all lesson plans
  def avg_rating
    ratings_arr = []
    lesson_plans.each do |plan|
      ratings_arr << plan.avg_rating
    end

    ratings_arr.sum/ratings_arr.length
  end
end
