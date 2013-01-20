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


  ##########################################################
  #
  #  lesson plans to return
  #
  ##########################################################

  # Search by grade, returns lesson_plans which are the grade passed in
  def self.search_by_grade(grade)
    tags = Tag.where(name: "Grade " + grade.to_s)
    plans = Array.new(tags.size) {|index| tags[index].lesson_plan}
  end

  # Search by difficulty, returns lesson_plans which are the difficulty pass in
  def self.search_by_difficulty(difficulty)
    tags = Tag.where(name: difficulty)
    plans = Array.new(tags.size) {|index| tags[index].lesson_plan}
  end

  # Search by length, returns lesson_plans which are the length pass in
  def self.search_by_length(length)
    tags = Tag.where(name: length + " minutes")
    plans = Array.new(tags.size) {|index| tags[index].lesson_plan}
  end

  # Search by subject, returns lesson_plans which are the subject pass in
  def self.search_by_subject(subject)
    LessonPlan.where(subject: subject)
  end

  # Search by rating, returns lesson_plans which are the rating pass in
  def self.search_by_rating(rating)
    #do the conversion to integer so we can use the rating in math equations
    rating = rating.to_i
    plans = []

    # find all the lesson plans greater than or equal to rating given
    LessonPlan.all.each do |plan|
      if plan.avg_rating >= rating
        plans << plan
      end
    end

    # return the lesson plans
    plans
  end
end
