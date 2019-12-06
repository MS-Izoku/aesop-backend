Rails.application.routes.draw do
  post '/login' , to: 'auth#create'
  get '/profile' , to: 'users#profile'
  patch '/update-profile' , to: 'users#update_profile'
  resources :users , only: [:index , :create, :show , :destroy] do
    #patch "/update-current-story" , to: "users#set_current_story"
    #patch "/set-current-chapter/:story_id" , to: "users#set_current_story"
    resources :stories do
      resources :characters
      resources :chapters do
          resources :footnotes
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
