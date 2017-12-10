Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  
  resources :buildings do
    member do
      post 'tag', to: 'buildings#tag'
      delete 'tag/:tag', to: 'buildings#untag'
    end
  end
  
  resources :roof_sets
  # do
  #   member do
  #     post 'tag' => 'roof_sets#tag'
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
