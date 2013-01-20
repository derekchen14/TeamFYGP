class LessonPlansController < ApplicationController

  def view
    @lesson_plan = LessonPlan.find(params[:id])
  end

end