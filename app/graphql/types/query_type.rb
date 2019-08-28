module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_hashtags, [HashtagType], null: false
    field :all_users, [UserType], null: false
    field :all_groups, [GroupType], null: false
    # First describe the field signature:
    field :user, UserType, null: true do
      argument :id, ID, required: true
    end
    field :group, GroupType, null: true do
      argument :id, ID, required: true
    end

    field :hashtag, HashtagType, null: true do
      argument :id, ID, required: true
    end

    # Then provide an implementation:
    def user(id:)
      User.find(id)
    end

    def group(id:)
      Group.find(id)
    end

    def hashtag(id:)
      Hashtag.find(id)
    end

    def all_hashtags
      Hashtag.all
    end

    def all_users
      User.all
    end

    def all_groups
      Group.all
    end

  end
end
