class SearchController < ApplicationController

  def search
    @title = 'Search'
  end

  def display
    @title = 'Search by '

    grade_plans = LessonPlan.search_by_grade(params[:grade])
    difficulty_plans = LessonPlan.search_by_difficulty(params[:difficulty])
    length_plans = LessonPlan.search_by_length(params[:length])
    subject_plans = LessonPlan.search_by_subject(params[:subject])
    rating_plans = LessonPlan.search_by_rating(params[:rating])

    @plans = grade_plans.reject {|n| !difficulty_plans.include?(n) || !length_plans.include?(n) || !subject_plans.include?(n) || !rating_plans.include?(n)}
  end

end