Rails.application.routes.draw do
  
  resources :cards, only: :index

  resources :quizzes, only: :show do
  	member {
  		get :verb
      get :noun
  		get :adjective
      get :conjunction
  	}
  end

  devise_for :users 

  devise_scope :user do
  	get 'login', to: "devise/sessions#new"
  	get 'signup', to: "devise/registrations#new"
  end



  root 'home#index'
end