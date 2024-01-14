class Mutations::EditProduct< Mutations::BaseMutation
    argument :price, String, required: true
    argument :name, String, required: true
    argument :product_type, String, required: true
    argument :image, String, required: true
    argument :category_id, Integer, required: true
    argument :description, String, required: true
    argument :product_id, Integer, required: true


    field :product, Types::ProductType, null: false
    field :errors, [String], null: false


    def resolve(price: nil, name: nil, product_type: nil, image: nil, category_id: nil, description: nil, product_id: nil)
      product = Product.find(product_id)
      
        product.price = price
        product.name = name
        product.product_type = product_type
        product.image = image
        product.category_id = category_id
        product.description = description
        
        if product.save
          
          { product: product, errors: [] }
        else
          { product: nil, errors: product.errors.full_messages }
        end
    end
end

