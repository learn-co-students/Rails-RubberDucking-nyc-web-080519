Rails.application.routes.draw do
  resources :ducks
  resources :students, only: [:index, :show, :new, :create, :edit, :update]
end


#Able to log a new student (and make sure that their name is not blank/mod is between 1 and 5)

#Able to edit a student's name (and make sure that their name is not blank/mod is between 1 and 5)
