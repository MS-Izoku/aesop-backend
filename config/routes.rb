Rails.application.routes.draw do
  post '/login' , to: 'auth#create'
  get '/profile' , to: 'users#profile'
  patch '/update-profile/:id' , to: 'users#update'
  resources :users , only: [:index , :create, :show , :destroy] do
    resources :stories do
      resources :characters
      resources :chapters do
          resources :footnotes
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
