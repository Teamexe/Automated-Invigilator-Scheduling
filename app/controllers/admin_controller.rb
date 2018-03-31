class AdminController < ApplicationController
  before_action :authenticate_teacher!,:is_admin
  def index
    @exams=Exam.all
    @teachers=Teacher.all
    @duties=ExamDuty.all
  end
  def automate
    automate_duties
    @duties=ExamDuty.all
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
  def add_teacher
    
     @teacher = Teacher.new(teacher_params)
     @teacher.password="generated_password"
     print @teacher
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
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
    ExamDuty.delete_all
    teachers_per_exam=2
    # allTeachers=Teacher.where(roles:0).order("RAND()")
    # ids = Teacher.pluck(:id).shuffle
    allTeachers=Teacher.where(roles:0).shuffle
    # allTeachers.each do |teacher|
    #   puts teacher.name
    # end
    teachersCount=allTeachers.count
    allExams=Exam.all
    k=-1
    (0...((allExams.count)*teachers_per_exam)).each do |i|
      if(i%teachers_per_exam==0)
        k=k+1
      end
      exam=ExamDuty.new(teacher_id:allTeachers[i%teachersCount].id,exam_id:allExams[k].id);
      exam.save!
      
    end
  
  end
  def exam_params
      if params['exam']
      params.require(:exam).permit(:course_id,:course,:time,:date,:cls,:room)
      end
    end

  def teacher_params
      if params['teacher']
      params.require(:teacher).permit(:name,:department,:email)
      end
    end
end
