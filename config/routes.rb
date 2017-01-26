Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'commission#home'

  get '/home',					to: 'commission#home'
  # get '/event',					to: 'event#show', 			as: 'event'
  # post "/commission/create",	to: 'commission#create', 	as: 'create_commission'
  # delete "/commission/delete",	to: 'commission#destroy',	as: 'delete_commission'
  resources :commission
  resources :event
  resources	:user

  post "/event/search", to: "event#search", as: "event_show"
  post "/user/search", to: "user#search", as: "user_show"
end
