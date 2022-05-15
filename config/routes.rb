Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    get '/' => 'admin/homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    patch '/order_details/:id' => 'admin/order_details#update'
  end

# get '/customers/is_deleted' => 'public/customers#is_deleted'
namespace :public, path: "" do
  resources :customers, only: [:show, :edit, :update]
  get '/customers/is_deleted' => 'customers#is_deleted'
  patch '/customers/withdraw' => 'customers#withdraw'
  get '/' => 'homes#top'
  get '/about' => 'homes#about'
  resources :items, only: [:index, :show]
  resources :send_addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:new, :create, :index, :show]
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/complete' => 'orders#complete'
  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
