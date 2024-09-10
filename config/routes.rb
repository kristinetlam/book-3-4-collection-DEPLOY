Rails.application.routes.draw do
  resources :user_books
  resources :users
  resources :books do
    member do
      get :delete
    end
  end
  
  root "user_books#index"
end
