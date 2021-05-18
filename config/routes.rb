Rails.application.routes.draw do
  devise_for :users
  
  root "projects#index"
  get "/index", to: "projects#index"
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
