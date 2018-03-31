class TeachersController < ApplicationController
  before_action :authenticate_teacher!,:is_member
  def index
    @duties=ExamDuty.where(teacher:current_teacher)
  end
  def change_password
    
  end
  def change
    old_password=params[:teacher][:password_old]
    new_password=params[:teacher][:password_new]
    # puts old_password,new_password
    if(current_teacher.valid_password?(old_password))
      puts "Valid"
      if @current_teacher.update_column(:encrypted_password, ::BCrypt::Password.create("#{new_password}"))
        sign_in(@current_teacher, :bypass => true)
    redirect_to '/teachers/index',notice: "Password Changed Succesfully!"
        
      end
    else
      redirect_to '/teachers/change_password',alert: 'Password does not match.'
    end
  end

  private
  def is_member
    if current_teacher.admin? == true
      redirect_to '/admin/index'
    end
  end
end
