class LessonPlan < ActiveRecord::Base
  attr_accessible :author_id, :description, :grade, :name, :subject, :id

  belongs_to :author
  has_many :tags
  has_many :comments
  has_many :ratings

  #returns the avg_rating of this lesson plan
  def avg_rating
    ratings_arr = []

    ratings.each do |rating|
      ratings_arr << rating.rating
    end

    #check for division by 0
    if ratings_arr.length == 0
      return 0
    end

    ratings_arr.sum/ratings_arr.length
  end

  def rating_name
    case avg_rating.round
    when 1
      "one"
    when 2
      "two"
    when 3
      "three"
    when 4
      "four"
    when 5
      "five"
    end
  end

  def short
    description[0..100]
  end

  ##########################################################
  #
  #  lesson plans to return
  #
  ##########################################################

  GRADES  = {:"1" => [1,2], :"3" => [3,4,5], :"6" => [6, 7, 8], :"9" => [9, 10, 11, 12], :K => [], }

  # Search by grade, returns lesson_plans which are the grade passed in
  def self.search_by_grade(grade)
    if grade == "all"
      return LessonPlan.all
    end

    grades = GRADES[grade.to_s.to_sym]
    tags_arr = Array.new(grades.size) {|index| Tag.where(name: "Grade " + grades[index].to_s)}
    plans = []
    tags_arr.each do |tags|
      tags.each do |tag|
        plans << tag.lesson_plan unless tag.blank?
      end
    end

    plans
  end

  # Search by difficulty, returns lesson_plans which are the difficulty pass in
  def self.search_by_difficulty(difficulty)
    if difficulty == "all"
      return LessonPlan.all
    end
    tags = Tag.where(name: difficulty)
    plans = Array.new(tags.size) {|index| tags[index].lesson_plan}
  end

  # Search by length, returns lesson_plans which are the length pass in
  def self.search_by_length(length)
    if length == "all"
      return LessonPlan.all
    end
    tags = Tag.where(name: length.to_s + " minutes")
    plans = Array.new(tags.size) {|index| tags[index].lesson_plan}
  end

  # Search by subject, returns lesson_plans which are the subject pass in
  def self.search_by_subject(subject)
    if subject == "all"
      return LessonPlan.all
    end
    LessonPlan.where(subject: subject)
  end

  # Search by rating, returns lesson_plans which are the rating pass in
  def self.search_by_rating(rating)
    if rating == "all"
      return LessonPlan.all
    end

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
