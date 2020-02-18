require 'test_helper'

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest

	setup do
    @product = products(:one)
  end

	test 'should create product' do
    assert_difference('Product.count') do
      post api_v1_products_url,
           params: { product: { name: "New product name", price: @product.price, amount: @product.amount, published: @product.published } },
           as: :json
    end
    assert_response :created
  end

  test "should not show products" do
  	assert_raises(ActionController::RoutingError)do
      get '/api/v1/products'
    end
  end

  test 'should update product' do
    patch api_v1_product_url(@product),
          params: { product: { name: @product.name } },
          as: :json
    assert_response :success
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete api_v1_product_url(@product), as: :json
    end
    assert_response :no_content
  end

end
