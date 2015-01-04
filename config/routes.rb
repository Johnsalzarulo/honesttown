Rails.application.routes.draw do
    get 'about' => 'pages#about'

  root 'pages#home'

  resources :people do
      resources :sentences
  end

  get "results" => 'people#results'
  get "search" => 'people#search'

end
