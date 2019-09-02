module Types
  class GroupType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :users, [UserType], null: false

    def users
      # move current user to front of array
      # object.users.sort { |a, b| a == context[:current_user] ? -1 : b == context[:current_user] ? 1 : 0 }
      [context[:current_user]] + (object.users - [context[:current_user]])
    end
  end
end
