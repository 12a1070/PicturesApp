Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end

  root 'users#new'
  resources :posts
  resources :contacts
  resources :pictures
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :update, :edit]
  resources :favorites, only: [:index, :create, :destroy, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
