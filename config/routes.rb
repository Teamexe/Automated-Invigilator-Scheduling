Rails.application.routes.draw do
  get 'admin/index'
  post 'admin/automate'
  post 'admin/add_exam'
  devise_for :teachers
  root 'main#index'
  get 'main/index'
  get 'teachers/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
