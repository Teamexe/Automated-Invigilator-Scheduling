class AdminController < ApplicationController
  before_action :authenticate_teacher!,:is_admin
  def index
    @exams=Exam.all
  end
  def automate
    automate_duties
    respond_to do |format|
        format.js{}
    end
  end
  def add_exam
    
     @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
        format.js{ }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def is_admin
    if current_teacher.admin? ==false
      redirect_to '/'
    end
  end
  def automate_duties
    
  end
  def exam_params
      if params['exam']
      params.require(:exam).permit(:course_id,:course,:time,:date,:cls,:room)
      end
    end
end
