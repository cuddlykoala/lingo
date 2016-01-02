Rails.application.routes.draw do
  get 'quizzes/show'

  resources :cards, only: :index

  devise_for :users 

  devise_scope :user do
  	get 'login', to: "devise/sessions#new"
  	get 'signup', to: "devise/registrations#new"
  end



  root 'home#index'
end