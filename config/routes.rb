Rails.application.routes.draw do
  resources :users do
    post '/login' , to: 'auth#create'
    get '/profile' , to: 'users#profile'
    resources :stories do
      resources :characters
      resources :chapters do
          resources :footnotes
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
