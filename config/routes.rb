Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :token, controller: 'application'
  resources :mitras, :only => [:show, :create, :update, :destroy] do
    resources :meditations
    resources :kirtans
  end
end
