Rails.application.routes.draw do
  get 'cart/index'
  post 'cart/add_product', to: 'cart#add_product', as: 'cart_add_product'
  delete 'cart/remove_product'
  root 'cart#index'
end
