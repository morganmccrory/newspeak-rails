Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "sign_out", to: "devise/sessions#destroy"
  end
  resources :users
  resources :headlines

  scope '/api' do
    scope '/v1' do
      scope '/users' do
        scope '/:phone' do
          get '/' => 'api_users#show'
        end
      end
    end
  end
end
