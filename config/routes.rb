Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'

  root 'movies#index'

  resources :movies do
    resources :appearences

    member do
      get 'create_cast'
    end

    member do
      get 'remove_cast'
    end

  end
  
  resources :actors
    
end
