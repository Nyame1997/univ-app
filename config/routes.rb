Rails.application.routes.draw do
  resources :students, except: [:destroy]
  root 'courses#index'
  resources :courses, except: [:destroy, :show]
  get 'about', to: 'pages#about'
end
