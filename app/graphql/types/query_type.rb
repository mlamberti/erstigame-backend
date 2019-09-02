module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :viewer, UserType, null: false
    def viewer
      context[:pundit].authorize context[:current_user], :show?
    end

    field :all_users, [UserType], null: false
    field :all_groups, [GroupType], null: false
    field :all_hashtags, [HashtagType], null: false

    field :user, UserType, null: true do
      argument :id, ID, required: true
    end

    field :group, GroupType, null: true do
      argument :id, ID, required: true
    end

    field :hashtag, HashtagType, null: true do
      argument :id, ID, required: true
    end

    def all_users
      context[:pundit].authorize User, :index?
      context[:pundit].policy_scope User
    end

    def all_groups
      Group.all
    end

    def all_hashtags
      context[:pundit].authorize Hashtag, :index?
      context[:pundit].policy_scope Hashtag
    end

    def user(id:)
      user = context[:pundit].policy_scope(User).find(id)
      context[:pundit].authorize user, :show?
    end

    def group(id:)
      Group.find(id)
    end

    def hashtag(id:)
      hashtag = Hashtag.find(id)
      context[:pundit].authorize hashtag, :show?
    end

  end
end
