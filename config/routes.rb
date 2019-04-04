Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Trestle::Engine.routes.draw do
    resources :users, only: %i[new edit], module: 'users_admin', controller: 'admin'
  end
end
