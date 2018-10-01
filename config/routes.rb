Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :posts do
    resources :comments
  end
  get 'send_report', to: 'posts#send_report', as: :send_report
 
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
