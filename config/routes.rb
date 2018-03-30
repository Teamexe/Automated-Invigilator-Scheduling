Rails.application.routes.draw do
  get 'admin/index'
  post 'admin/automate'
  devise_for :teachers
  root 'main#index'
  get 'main/index'
  get 'teachers/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
