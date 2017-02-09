Rails.application.routes.draw do
  
  get 'welcome/index'

  post '/payment' => 'orders#payment_status'
  get "refund/:id", to: "orders#refund"
  resources :orders, only: [:index,:show] 
  

  get 'payment_links/payment_complete'
  resources :payment_links

  get 'home/my_batches'
  get 'home/my_payments'


  devise_for :users

  resources :home

  scope '/admin' do
    resources :users
    resources :payments
    get 'batches/payment_mail'
    resources :batches
  end

  root 'welcome#index'

=begin
  devise_scope :user do
    root to: "devise/sessions#new"
  end
=end

=begin
  if current_user.nil?
    root to: "devise/sessions#new"
  elsif current_user.role? "student"
    root 'home#index'
  else
    root 'batches#index'
  end
=end    

end
