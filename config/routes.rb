Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  
  resources :buildings
  resources :roof_sets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
