class Mutations::CreateCategory< Mutations::BaseMutation
    argument :name, String, required: true
    


    field :category, Types::CategoryType, null: false
    field :errors, [String], null: false


    def resolve(name: nil)
      
        
        category = Category.create!(
            name: name,
            
        )
        if category.save
          
          { category: category, errors: [] }
        else
          { category: nil, errors: category.errors.full_messages }
        end
    end
end

