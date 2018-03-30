class TeachersController < ApplicationController
  before_action :authenticate_teacher!,:is_member
  def index
  end
  private
  def is_member
    if current_teacher.admin? == true
      redirect_to '/admin/index'
    end
  end
end
