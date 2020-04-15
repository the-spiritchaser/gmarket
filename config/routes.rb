Rails.application.routes.draw do  
  root 'products#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  resources :products, only: [:new, :create, :show, :destroy, :edit, :update] do
    collection do
      get 'category_children', defaults: {format: 'json'}
      get 'category_grandchildren', defaults: {format: 'json'}
    end
  end

end
