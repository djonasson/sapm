Sapm::Application.routes.draw do

  devise_for :users, controllers: { confirmations: "confirmations" }
  as :user do
    put '/users/confirmation' => 'confirmations#update', as: :update_user_confirmation
  end

  namespace :admin do
    resources :projects
    resources :users
  end

  resources :projects, only: [:index, :show, :edit] do
    resources :categories do
      member do
        post 'move'
      end
      resources :features do
        member do
          post 'move'
        end
        resources :scenarios do
          member do
            post 'move'
          end
        end
      end
    end
  end

  resource :profile, only: [:show]


  get "dashboard/index"

  root to: 'dashboard#index'
end
