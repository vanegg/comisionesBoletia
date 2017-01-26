Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'commission#home'
  get '/home',		to: 'commission#home'
  get '/event',		to: 'event#show', 		as: 'event'
end
