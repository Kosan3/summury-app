Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => 'homes#about'
  get '/help' => 'homes#help'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
