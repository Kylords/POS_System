module Mutations
    class LoginUser < BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true
  
      field :token, String, null: true
      field :errors, [String], null: false
      field :user, Types::UserType, null: true
  
      def resolve(email:, password:)
        user = User.find_by(email: email)
      
        if user&.authenticate(password)
          token = JWT.encode({ user_id: user.id }, 'my_secret', 'HS256')
          context[:session] ||= {}
          context[:session][:user_id] = user.id
          { user: user, token: token, errors: [] }
        else
          { user: nil, token: nil, errors: ["Invalid email or password"] }
        end
      end
      
    end
  end