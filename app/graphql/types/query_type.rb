module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_users, [UserType], null: false
    field :all_groups, [GroupType], null: false
    # First describe the field signature:
    field :user, UserType, null: true do
      description "Find a user by ID"
      argument :id, ID, required: true
    end

    # Then provide an implementation:
    def user(id:)
      User.find(id)
    end

    def all_users
      User.all
    end

    def all_groups
      Group.all
    end

  end
end
