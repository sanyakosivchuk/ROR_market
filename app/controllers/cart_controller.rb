class CartController < ApplicationController
  before_action :initialize_cart

  def show
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] ||= @cart.id
  end
  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)

    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
    elsif quantity <= 0
      current_orderable.destroy if current_orderable
    else
      Orderable.create(product: @product, quantity: quantity, cart: @cart)
    end      
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] ||= @cart.id
    end
  end


end
