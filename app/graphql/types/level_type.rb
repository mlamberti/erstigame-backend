module Types
  class LevelType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :rank, Integer, null: false
    field :num_hours, Integer, null: false
    field :num_places, Integer, null: false
    field :num_sponsors, Integer, null: false
    field :num_catches, Integer, null: false
    field :required_hashtags, [HashtagType], null: true
    field :createdAt, String, null: true
    field :updatedAt, String, null: true

  end
end
