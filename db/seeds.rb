products = [ 
  { name: 'Green Tea', product_code: 'GR1', price: 3.11 },
  { name: 'Strawberries', product_code: 'SR1', price: 5.00 },
  { name: 'Coffee', product_code: 'CF1', price: 11.23 }
]

products.each { |product| Product.find_or_create_by(product) }
