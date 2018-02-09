Rails.application.routes.draw do

  resources :questions
  resources :advertisements
  resources :contacts, only: [:new, :create]
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'
  get '*path' => redirect('/')

  root 'welcome#index'

  end
