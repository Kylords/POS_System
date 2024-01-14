user = User.create(first_name: "User", last_name: "Sample", email: "user@sample.com", password: "123456", password_confirmation: "123456", mobile: "09123456789")
user.create_cart()
admin = User.create(first_name: "Admin", last_name: "Sample", email: "admin@sample.com", password: "123456", password_confirmation: "123456", admin: true)
admin.create_cart()
Category.create(name: "Sports")

Category.create(name: "Life Essentials")

Product.create(category_id: 1, name: "Bike", product_type: "physical", description: "Bicycle", price: "5000", image: "https://mrwallpaper.com/images/hd/black-mountain-bike-near-river-9qo42hcz12q9z3u4.jpg")

Product.create(category_id: 1, name: "Basketball ball", product_type: "physical", description: "ball", price: "800", image: "https://images.unsplash.com/photo-1627627256672-027a4613d028?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D")

Product.create(category_id: 2, name: "Aircon", product_type: "physical", description: "cool", price: "10000", image: "https://wallpapercave.com/wp/wp8216217.jpg")





Delivery.create(delivery_method: "Standard", price: "40", enabled: true)

Delivery.create(delivery_method: "Express", price: "100", enabled: true)

Delivery.create(delivery_method: "Same Day", price: "200", enabled: false)

Payment.create(payment_method: "Cash on Delivery", enabled: true)

Payment.create(payment_method: "Gcash", enabled: true)

Payment.create(payment_method: "Debit/Credit Card", enabled: true)


Order.create(email: 'sample@email.com', first_name: 'Kyle', last_name: 'Jobs', mobile: '091111111', user_id: 1, product_ids: [1], order_type: "online", delivery_address: "Apitong, Loma, Binan, Laguna", status: "Pending", quantity: 1, total_price: "5000", delivery_id: 1, payment_id: 1)
Order.create(email: 'my@email.com', first_name: 'Stan', last_name: 'Ren', mobile: '092222222', user_id: 1, product_ids: [2], order_type: "online", delivery_address: "Apitong, Loma, Binan, Laguna", status: "Confirmed", quantity: 2, total_price: "1600", delivery_id: 3, payment_id: 1)
Order.create(email: 'your@email.com', first_name: 'Carl', last_name: 'San', mobile: '093333333', user_id: 1, product_ids: [3], order_type: "online", delivery_address: "Apitong, Loma, Binan, Laguna", status: "Completed", quantity: 1, total_price: "10000", delivery_id: 2, payment_id: 3)
Order.create(email: 'nice@email.com', first_name: 'Steve', last_name: 'Tan', mobile: '093333333', user_id: 1, product_ids: [1, 3], order_type: "online", delivery_address: "Apitong, Loma, Binan, Laguna", status: "Pending", quantity: 1, total_price: "5000", delivery_id: 1, payment_id: 2)

CartItem.create(cart_id: 1, product_id: 1, quantity: "1", total_price: "5000")