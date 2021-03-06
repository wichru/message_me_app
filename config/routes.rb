Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'message', to: 'messages#index'
  post 'message', to: 'messages#create'
  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'

  mount ActionCable.server, at: 'cable'
end
