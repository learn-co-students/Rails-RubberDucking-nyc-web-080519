Rails.application.routes.draw do
  resources :ducks, only: [:index]
  resources :students, only: [:index]

  get '/students/new', to: 'students#new'
  get '/students/:id', to: 'students#show', as: 'student'
  get '/students/:id/edit', to: 'students#edit'

  post '/students', to: 'students#create'
  patch '/students/:id', to: 'students#update'

  get '/ducks/new', to: 'ducks#new'
  get '/ducks/:id', to: 'ducks#show', as: 'duck'
  get '/ducks/:id/edit', to: 'ducks#edit'

  post '/ducks', to: 'ducks#create'
  patch '/ducks/:id', to: 'ducks#update'

end
