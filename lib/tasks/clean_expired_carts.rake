namespace :carts do

 desc "Delete expired carts and update stock"
 task :clear_expired => :environment do
 	 Cart.where('expires_at < ?', Time.now).each do |cart| 
     cart.cart_lines.each do |cart_line|
        product = Product.find(cart_line.product.id)
        product.amount += cart_line.quantity
        product.save
     end
     cart.destroy
 	 end
 end

end