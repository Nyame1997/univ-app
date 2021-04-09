Rails.application.routes.draw do
  resources :students, except: [:destroy]
  root 'courses#index'
  resources :courses, except: [:destroy, :show]
  get 'about', to: 'pages#about'
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  post 'course_enroll', to: 'student_courses#create'
end
