class Api::V1::CartLinesController < ApplicationController

  before_action :current_cart

  def create
    update_amount 
    add_cart_line
    if @cart.save
      render json: @cart.to_json, status: :created
    else
      render json: { errors: @cart.errors }, status: :unprocessable_entity
    end
  end

  def update
    @cart_line = CartLine.find_by(cart_line_params.extract!(:product_id,:cart_id))
    @cart_line.product.amount += @cart_line.quantity
    @cart_line.product.amount -=  cart_line_params[:quantity]
    @cart_line.product.save
    if @cart_line.update(cart_line_params)
      render json: @cart_line.to_json, status: :ok
    else
      render json: @cart_line.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_line = CartLine.find_by(cart_line_params.extract!(:product_id,:cart_id))
    @cart_line.product.amount += @cart_line.quantity
    @cart_line.product.save
    @cart_line.destroy
    head 204
  end

private

  def add_cart_line
    @cart_line = CartLine.find_or_initialize_by(cart_line_params.extract!(:product_id,:cart_id))
    @cart_line.quantity += cart_line_params[:quantity]
    @cart_line.price = @product.price 
    @cart.cart_lines << @cart_line 
  end

  def update_amount
    @product = Product.find(cart_line_params[:product_id])
    @product.amount -= cart_line_params[:quantity]
    @product.save! 
  end

  def current_cart
    if session[:cart]
      @cart = Cart.find_by_id(session[:cart]) 
      @cart ? @cart.remove_expired : @cart = Cart.create
    else
      @cart = Cart.create
    end
    session[:cart] = @cart.id
    params[:cart_line].merge!({cart_id: @cart.id})
  end

  def cart_line_params
    params.require(:cart_line).permit(:product_id, :cart_id, :quantity)
  end

end
