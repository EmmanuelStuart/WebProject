Rails.application.routes.draw do
  get 'products/index'

  get 'products/display'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'main/index'


  #get 'display' => 'products#index', as: 'display'
  get 'index' => 'products#index', as: 'products'
  get 'products/:number' => 'products#product', constraints: { number: /\d+/ }, as: 'displayProduct'


  resources 'products', only: [:index, :display]

  #Main controller
  get 'about' => 'main#about', as: 'about'






  root 'main#index'
end
