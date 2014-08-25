Rails.application.routes.draw do
  root "welcome#index"

  resources :movies, only: [:new, :create]

end
