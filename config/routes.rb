Rails.application.routes.draw do
  
  root 'movies#index'

  resources :movies do
    resources :appearences

    member  do
      get 'create_cast'
    end

  end
  
  resources :actors
    
end
