class Mutations::CreateUser < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :admin, Boolean, required: false

    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    field :token, String, null: true


    def resolve(first_name: nil, last_name: nil, email: nil, password: nil, password_confirmation: nil, admin: nil)
        user = User.new(
            first_name: first_name,
            last_name: last_name,
            email: email,
            password: password,
            password_confirmation: password_confirmation,
            admin: admin
      )
      if user.save
        token = JWT.encode({ user_id: user.id }, 'my_secret', 'HS256')
        user.create_cart()
        { user: user, token: token, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end

end