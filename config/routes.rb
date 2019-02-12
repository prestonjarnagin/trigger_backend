Rails.application.routes.draw do

  get '/', to: 'welcome#show'

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index]
      resources :reactions, only: [:index]
    end
  end
end
