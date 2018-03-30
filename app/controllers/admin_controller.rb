class AdminController < ApplicationController
  before_action :authenticate_teacher!,:is_admin
  def index
  end
  def automate
    automate_duties
    respond_to do |format|
        format.js{}
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
end
