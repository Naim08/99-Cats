Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "cats#index" #TBT ON INTRUSTOR
  resources :cats, only: [:index, :show, :create, :update, :new, :edit]

end
