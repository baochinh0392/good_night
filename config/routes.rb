Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        resources :friends, only: %i() do
          collection do
            post :follow
            post :unfollow
          end
        end
        resources :sleep_operations, only: %i(index) do
          collection do
            post :sleep
            post :get_up
            get :list_friends
          end
        end
      end
    end
  end
end
