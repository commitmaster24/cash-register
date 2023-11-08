class CartController < ApplicationController
  before_action :set_cart, only: %i[index]

  def index
  end

  def add_product
    product = Product.find_by(product_code: params[:product_code])
    session[:cart] ||= {}
    session[:cart][product.product_code] = { 'quantity' => 0, 'price' => product.price } unless session[:cart][product.product_code]

    session[:cart][product.product_code]['quantity'] += params[:decrease_product] ? -1 : 1

    if session[:cart][product.product_code]['quantity'] == 0
      session[:cart].delete(params[:product_code])
    else
      session[:cart][product.product_code]['price'] = product.price
      session[:cart][product.product_code]['name'] = product.name
      session[:cart][product.product_code]['sub_total'] = (product.price * session[:cart][product.product_code]['quantity'].to_f).round(2)
    end
    redirect_to cart_index_path
  end

  def remove_product
    session[:cart].delete(params[:product_code])
    flash[:notice] = "Product removed from cart!"
    redirect_to cart_index_path
  end

  private

  def set_cart
    @cart = session[:cart] || {}
  end
end
