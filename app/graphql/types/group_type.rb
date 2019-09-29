module Types
  class GroupType < BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :name, String, null: false
    field :photos, [PhotoType], null: false
    field :points, Integer, null: false
    field :level, LevelType, null: false
    field :rallye_stations, [RallyeStationType], null: false
    field :createdAt, String, null: true
    field :updatedAt, String, null: true
    field :num_catches, Integer, null: false
    field :num_places, Integer, null: false
    field :num_sponsors, Integer, null: false
    field :num_hours, Float, null: false
    field :hashtags_available, [HashtagType], null: true

    field :users, [UserType], null: false
    def users
      # move current user to front of array
      # object.users.sort { |a, b| a == context[:current_user] ? -1 : b == context[:current_user] ? 1 : 0 }
      [context[:current_user]] + (object.users - [context[:current_user]])
    end
    field :token, String, null: true
    def token
      return object.join_token if context[:current_user].group==object
    end

  end
end
