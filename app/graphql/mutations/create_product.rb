class Mutations::CreateProduct< Mutations::BaseMutation
    argument :price, String, required: true
    argument :name, String, required: true
    argument :product_type, String, required: true
    argument :image, String, required: true
    argument :category_id, Integer, required: true
    argument :description, String, required: true


    field :product, Types::ProductType, null: false
    field :errors, [String], null: false


    def resolve(price: nil, name: nil, product_type: nil, image: nil, category_id: nil, description: nil)
      
        
        product = Product.create!(
            price: price,
            name: name,
            product_type: product_type,
            image: image,
            category_id: category_id,
            description: description
        )
        if product.save
          
          { product: product, errors: [] }
        else
          { product: nil, errors: product.errors.full_messages }
        end
    end
end

