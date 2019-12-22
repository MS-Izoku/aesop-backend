Rails.application.routes.draw do
  post '/login' , to: 'auth#create'
  get '/profile' , to: 'users#profile'
  patch '/update-profile' , to: 'users#update_profile'
  
  resources :users , only: [:index , :create, :show , :destroy] do
    get '/min-index' , to: 'stories#minimal_index'
    resources :stories do
      resources :characters
      resources :chapters do
          resources :footnotes
      end
    end
  end
end
