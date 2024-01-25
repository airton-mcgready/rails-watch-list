Rails.application.routes.draw do
  root to: "lists#index"

  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: :create
    resources :movies, only: [:index, :new, :create, :destroy]
    post 'add_movie_to_list', on: :member
  end

  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
