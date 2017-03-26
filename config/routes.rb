Rails.application.routes.draw do
  get 'products/index'

  get 'products/display'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'main/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  #get 'display' => 'products#index', as: 'display'
  get 'products' => 'products#index', as: 'display'
  get 'products/:number' => 'products#display', constraints: { number: /\d+/ }, as: 'displayProduct'

  #Main controller
  get 'about' => 'main#about', as: 'about'





  root 'main#index'
end
