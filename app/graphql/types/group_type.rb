module Types
  class GroupType < BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :name, String, null: false
    field :photos, [PhotoType], null: false
    field :points, Integer, null: false
    field :level, LevelType, null: false
    field :rallye_ratings, [RallyeRatingType], null: false
    field :createdAt, String, null: true
    field :updatedAt, String, null: true
    field :num_catches, Integer, null: false
    field :num_places, Integer, null: false
    field :num_sponsors, Integer, null: false
    field :time_together, Integer, null: false

    field :users, [UserType], null: false
    def users
      # move current user to front of array
      # object.users.sort { |a, b| a == context[:current_user] ? -1 : b == context[:current_user] ? 1 : 0 }
      [context[:current_user]] + (object.users - [context[:current_user]])
    end

    field :hashtags, [HashtagType], null: true
    def hashtags
      Hashtag.where("level_id <= ?", object.rank).or(Hashtag.where(level: nil)).order(:level_id)
    end

  end
end
