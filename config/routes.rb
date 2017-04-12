Rails.application.routes.draw do
  get 'order/cart'

  get 'charges/new'

  get 'charges/create'

  get 'products/index'

  get 'products/display'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'main/index'

  #get URL => 'controllerName#methodName', as: path
  get 'index' => 'products#index', as: 'products'
  get 'products/:number' => 'products#display', constraints: { number: /\d+/ }, as: 'displayProduct'
  get 'recentlyUpdated' => 'products#recentlyUpdated', as: 'displayRecentlyUpdated'
  get 'new' => 'products#new', as: 'displayNew'

  resources 'products', only: [:index, :display]

  #resources :charges
  #Main controller
  get 'about' => 'main#about', as: 'about'
  get 'contact' => 'main#contact', as: 'contact'

  get 'signup' => 'sessions#signup', as: 'signup'
  get 'login' => 'sessions#login', as: 'login'
  get 'logout' => 'sessions#logout', as: 'logout'
  get 'cart' => 'order#cart', as: 'cart'

  root 'main#index'
end
