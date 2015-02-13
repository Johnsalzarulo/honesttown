Rails.application.routes.draw do
    get 'about' => 'pages#about'

  root 'pages#home'
  get "share" => 'pages#share'

  resources :people do
      resources :sentences 
  end

  resources :tweets do
  end

  get "results" => 'people#results'
  get "search" => 'people#search'


end
