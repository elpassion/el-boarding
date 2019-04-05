Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Trestle::Engine.routes.draw do
    resources :epic, only: %i[new edit], module: 'epic_admin', controller: 'admin'
    resources :epic_list, only: %i[new edit], module: 'epic_list_admin', controller: 'admin'
    resources :users, only: %i[new edit], module: 'users_admin', controller: 'admin'
    resources :questions, only: %i[new edit], module: 'questions_admin', controller: 'admin'

    scope :auth do
      resources :administrators_admin, only: %i[new edit], module: 'auth/administrators_admin', controller: 'admin'
    end
  end
end
