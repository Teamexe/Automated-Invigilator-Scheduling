Rails.application.routes.draw do
  get 'admin/index'
  post 'admin/automate'
  post 'admin/add_exam'
  post 'admin/add_teacher'
  devise_for 'teachers', :controllers => {:registrations => "registrations"}
  root 'main#index'
  get 'main/index'
  get 'teachers/index'
  get 'teachers/change_password'
  post 'teachers/change'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
