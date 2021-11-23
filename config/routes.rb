Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show,:index]
  root 'recruits#index'
  get 'users/find'=>'users#find'
  get 'recruits/top' => 'recruits#top'
  get 'recruits/list' => 'recruits#list'
  get 'recruits/index' => 'recruits#index'
  get 'recruits/new' => 'recruits#new'
  post 'recruits' => 'recruits#create'
  get 'recruits/:id' => 'recruits#show',as: 'recruit'
  delete 'recruits/:id' => 'recruits#destroy'
  get 'rooms/index' => 'rooms#index'

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  resources :recruit do
    resources :comments, only: [:create]
  end
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
end
