Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'commission#home'

  get '/home',					to: 'commission#home'
  post '/commission/create',	to: 'commission#create', 	as: 'create_commission'
  post '/event/search', 		to: 'event#search', 		as: 'event_show'
  post '/user/search', 			to: 'user#search', 			as: 'user_show'
  post '/booking/create',		to: 'booking#create',		as: 'create_booking'
  resources :commission
  resources :event
  resources	:user
  resources :booking
end
