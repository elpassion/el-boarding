Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Trestle::Engine.routes.draw do
    resources :users, only: %i[new edit], module: 'users_admin', controller: 'admin'
    resources :epic_list, only: %i[new edit], module: 'epic_list_admin', controller: 'admin'
    resources :epic, only: %i[new edit], module: 'epic_admin', controller: 'admin'
    resources :tasks, only: %i[new edit], module: 'tasks_admin', controller: 'admin'
    scope :auth do
      resources :administrators_admin, only: %i[new edit], module: 'auth/administrators_admin', controller: 'admin'
    end
  end
end
