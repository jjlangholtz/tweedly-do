Rails.application.routes.draw do
  root 'users#new'

  resource :logins, only: [:new, :create, :destroy]

  shallow do
    resources :users, only: [:new, :create, :show] do
      resources :todo_lists, except: :show
      resources :todos, except: [:index, :show] do
        post :toggle, on: :member
      end
    end
  end
end
