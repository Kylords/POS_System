
module Mutations
    class LogoutUser < BaseMutation
      field :success, Boolean, null: false
      field :errors, [String], null: false
    
      def resolve
        if context[:current_user]
            if context[:current_user].present?
                context[:current_user] = nil
                { success: true, errors: [] }
            end
        else
            { success: false, errors: ["User not logged in"] }
        end
      end

      
    end
  end
  
  