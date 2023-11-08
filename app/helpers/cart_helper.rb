module CartHelper
  def get_all_products
    Product.all
  end

  def calculate_total_price
    total_price = 0
    @cart.each do |code, item|
      product = Product.find_by(product_code: code)
      product_name = product.name
      if product_name == 'Green Tea'
        total_price += (item['quantity'] / 2 + item['quantity'] % 2) * product.price
      elsif product_name == 'Strawberries' && item['quantity'] >= 3
        total_price += item['quantity'] * 4.50
      elsif product_name == 'Coffee' && item['quantity'] >= 3
        total_price += item['quantity'] * (product.price * 2 / 3)
      else
        total_price += item['quantity'] * product.price
      end
    end
    total_price.round(2)
  end
end
