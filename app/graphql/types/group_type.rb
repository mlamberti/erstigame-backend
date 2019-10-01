module Types
  class GroupType < BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :name, String, null: false
    field :number, Integer, null: false
    field :level, LevelType, null: false
    field :points, Integer, null: false
    field :rallye_ratings, [RallyeRatingType], null: false
    field :createdAt, String, null: true
    field :updatedAt, String, null: true
    field :num_catches, Integer, null: false
    field :num_places, Integer, null: false
    field :num_sponsors, Integer, null: false
    field :num_hours, Float, null: false
    field :hashtags_available, [HashtagType], null: true

    field :photos, [PhotoType], null: false
    def photos
      object.photos.order date: 'DESC'
    end

    field :users, [UserType], null: true
    def users
      return unless context[:current_user]
      # move current user to front of array
      # object.users.sort { |a, b| a == context[:current_user] ? -1 : b == context[:current_user] ? 1 : 0 }
      [context[:current_user]] + (object.users - [context[:current_user]])
    end
    field :token, String, null: true
    def token
      return object.join_token if context[:current_user].group==object
    end

    field :rallye_rating, RallyeRatingType, null: true
    def rallye_rating
      object.rallye_ratings.find_by rallye_station: context[:current_user] if context[:current_user].is_a? RallyeStation
    end

    field :rallye_points, Integer, null: false
    def rallye_points
      object.rallye_ratings.sum :points
    end
  end
end
