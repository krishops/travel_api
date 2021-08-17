Rails.application.routes.draw do
  resources :reviews

  get '/mostpopular' => 'reviews#most_popular'
  get '/random' => 'reviews#random'

end
