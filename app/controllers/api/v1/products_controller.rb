class Api::V1::ProductsController < ApplicationController


  before_action :set_product, only: %i[update destroy]

  def create
    product = Product.new(product_params)
    if product.save
      render json: product.to_json, status: :created
    else
      render json: { errors: product.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product.to_json, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head 204
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :amount)
  end

end
