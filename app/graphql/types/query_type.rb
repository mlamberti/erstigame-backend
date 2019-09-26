module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :viewer, UserType, null: true
    def viewer
      context[:pundit].authorize context[:current_user], :show?
    end

    field :user, UserType, null: true do
      argument :id, ID, required: true
    end

    def user(id:)
      user = context[:pundit].policy_scope(User).find(id)
      context[:pundit].authorize user, :show?
    end

    field :group, GroupType, null: true do
      argument :id, ID, required: true
    end

    def group(id:)
      Group.find(id)
    end

    field :hashtag, HashtagType, null: true do
      argument :hashtag_id, ID, required: true
    end

    def hashtag(hashtag_id:)
      hashtag = ErstigameBackendSchema.object_from_id(hashtag_id, context)
      context[:pundit].authorize hashtag, :show?
    end

  end
end
