Rails.application.routes.draw do
  root 'home#top'
  devise_for :admins, controllers:{
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    registrations: "admins/registrations"
  }
  devise_for :members, controllers:{
    sessions: "members/sessions",
    passwords: "members/passwords",
    registrations: "members/registrations"
  }
  namespace :admins do
    get '/', to: "home#top"
    resources :members, only:[:index, :show, :edit, :update]
    resources :products, except:[:destroy]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
    resources :categories, only:[:index, :create, :edit, :update]
  end
  resources :products, only:[:index, :show]
  resources :members, only:[:show, :edit, :update] do
    member do
      get "delete"
      patch "destroy", as: "destroy"
    end
    resources :cart_items, only:[:index, :create, :update, :destroy] do
      collection do
        delete "destroy_all"
      end
    end
    resources :orders, only:[:index, :show, :new, :create] do
      collection do
        get "confirmation"
        post "confirmation"
        get "fixed"
      end
    end
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
