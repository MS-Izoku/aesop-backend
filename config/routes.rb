Rails.application.routes.draw do
  resources :footnotes
  # resources :character_in_chapters
  # resources :characters
  # resources :user_stories
  # resources :users
  # resources :chapters
  # resources :stories

  resources :users do
    resources :stories do
      resources :characters
      resources :chapters
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
