Rails.application.routes.draw do

  get 'users/show'

  get 'users/update'

  resources :languages, except: [:edit, :update, :destroy]

  resources :words, except: [:edit, :destroy]

  resources :cards, only: [:index, :new, :create]

  resources :quizzes, only: :show do
  	member {
  		get :verb
      get :noun
  		get :adjective
      get :conjunction
      post :next_question
  	}
  end

  devise_for :users 

  devise_scope :user do
  	get 'login', to: "devise/sessions#new"
  	get 'signup', to: "devise/registrations#new"
  end



  root 'home#index'
end