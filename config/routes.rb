Rails.application.routes.draw do
  # resources :ducks, only: [:index]
  # resources :students, only: [:index]


  #DUCKS ROUTES
  get '/ducks', to: 'ducks#index', as: 'ducks'
  get '/ducks/new', to: 'ducks#new', as: 'new_duck'
  get '/ducks/:id', to: 'ducks#show', as: 'duck'
  get '/ducks/:id/edit', to: 'ducks#edit', as: 'edit_duck'
  patch '/ducks/:id', to: 'ducks#update'
  post '/ducks', to: 'ducks#create'
  delete '/ducks/:id', to: 'ducks#destroy'

  #STUDENT ROUTES
  get '/students', to: 'students#index', as: 'students'
  get '/students/new', to: 'students#new', as: 'new_student'
  get '/students/:id', to: 'students#show', as: 'student'
  get '/students/:id/edit', to: 'students#edit', as: 'edit_student'
  patch '/students/:id', to: 'students#update'
  post '/students', to: 'students#create'
  delete '/students/:id', to: 'students#destroy'

end
