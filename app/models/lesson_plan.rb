class LessonPlan < ActiveRecord::Base
  attr_accessible :author_id, :description, :grade, :name, :subject

  belongs_to :author
  has_many :tags
  has_many :comments
  has_many :ratings

  #returns the avg_rating of this lesson plan
  def avg_rating
    ratings_arr = []

    ratings.each do |rating|
      ratings_arr << rating.value
    end

    ratings_arr.sum/ratings_arr.length
  end

end
