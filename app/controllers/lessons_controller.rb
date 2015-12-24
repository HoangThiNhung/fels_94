class LessonsController < ApplicationController
  before_action :logged_in_user
  
  def create
    @lesson = current_user.lessons.new lesson_params
    if @lesson.save
      redirect_to @lesson
    else
      flash[:success] = t "create_lesson_fails"
      redirect_to root_url
    end
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson_params
      flash[:success] = t "study_finish"
      render "result"
    else
      redirect_to :back
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit :category_id, :learned, results_attributes: [:id, :answer_id]
  end
end