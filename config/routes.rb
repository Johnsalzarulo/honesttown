Rails.application.routes.draw do
    get 'about' => 'pages#about'

  root 'pages#home'
  get "share" => 'pages#share'

  resources :people do
      resources :sentences do 
      	resources :tweets
      end
  end

  resources :tweets

  get "results" => 'people#results'
  get "search" => 'people#search'
  get "share" => 'tweets#share'


end
