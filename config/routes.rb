Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
  root "projects#index"
  get "/index", to: "projects#index"
  resources :projects do
    resources :comments
    resources :projects_students, only:  [:create, :show]
    # post "enrol" => "projects_students#create"
  end

  resource :users do
    resources :profiles
  end
  
  resources :transactions, only: [:create]
  get 'checkout/success', to: 'transactions#success'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
