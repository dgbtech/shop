class Cart < ApplicationRecord

  before_validation :set_total!

  has_many :cart_lines, dependent: :destroy
  has_many :products, :through => :cart_lines

  def remove_expired
   	return true unless self.expired?
      self.cart_lines.each do |cart_line|
        product = Product.find(cart_line.product.id)
        product.amount += cart_line.quantity
        product.save
    end
    self.cart_lines.destroy_all
  end

  def expired?
    if self.expires_at && (self.expires_at < Time.now)
      return true
    else
      false
    end
  end

  private

  def set_total! 
    self.expires_at = Time.now + 10.minutes
    self.total = cart_lines.map{ |cl| cl.quantity * cl.price }.sum
  end
end