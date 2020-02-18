require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "Product stock is allways positive" do
    product = products(:one)
    product.amount = -1
    assert_not product.valid?
  end

  test "Product price is allways positive" do
    product = products(:one)
    product.price = -1
    assert_not product.valid?
  end

end
