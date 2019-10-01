module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :viewer, UserType, null: true
    def viewer
      return unless context[:current_user]
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

    field :group_by_token, GroupType, null: true do
      argument :token, String, required: true
    end

    def group_by_token(token:)
      Group.find_by join_token: token
    end

    field :hashtag, HashtagType, null: true do
      argument :hashtag_id, ID, required: true
    end

    def hashtag(hashtag_id:)
      hashtag = ErstigameBackendSchema.object_from_id(hashtag_id, context)
      context[:pundit].authorize hashtag, :show?
    end

    field :rallye_station, RallyeStationType, null: true do
      argument :token, String, required: true
    end

    def rallye_station(token:)
      context[:current_user] = RallyeStation.find_by token: token
    end

  end
end
