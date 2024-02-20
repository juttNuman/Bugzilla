Rails.application.routes.draw do
  require 'sidekiq/web'
  devise_for :users
root 'projects#index'

get '/projects/:project_id/users/:user_id/collaborations/:id', to: 'collaborations#destroy', as: 'delete_collaboration'

resources :projects do
    resources :collaborations, only: [:create]
end

resources :projects do  
  resources :bugs
end

resources :bugs

post "/assign/:id" , to: "bugs#assign" 


mount Sidekiq::Web => '/sidekiq'



end
