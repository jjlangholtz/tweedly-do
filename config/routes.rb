Rails.application.routes.draw do
  root 'logins#new'

  resource :logins, only: [:new, :create, :destroy]

  shallow do
    resources :users, only: [:new, :create, :show] do
      resources :todo_lists, except: :index
      resources :todos, except: [:index, :show]
    end
  end
end
