Rails.application.routes.draw do
  get 'products/index'

  get 'products/display'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'main/index'


  #get URL => 'controllerName#methodName', as: path
  get 'index' => 'products#index', as: 'products'
  get 'products/:number' => 'products#display', constraints: { number: /\d+/ }, as: 'displayProduct'


  resources 'products', only: [:index, :display]

  #Main controller
  get 'about' => 'main#about', as: 'about'
  get 'contact' => 'main#contact', as: 'contact'






  root 'main#index'
end
