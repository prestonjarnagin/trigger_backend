Rails.application.routes.draw do

  get '/', to: 'welcome#show'

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :create, :update]
      resources :reactions, only: [:index, :create, :update]
      resources :reaction_entries, only: [:index, :create, :update, :destroy]
      resources :food_entries, only: [:index, :create, :update]

    end
  end
end
