module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :viewer, UserType, null: true
    def viewer
      context[:pundit].authorize context[:current_user], :show?
    end

  end
end
