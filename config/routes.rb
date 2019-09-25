Rails.application.routes.draw do
  resources :users do
    resources :stories do
      resources :characters
      resources :chapters do
          resources :footnotes
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
