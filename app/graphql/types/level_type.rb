module Types
  class LevelType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :num_hours, Integer, null: false
    field :num_places, Integer, null: false
    field :num_sponsors, Integer, null: false
    field :num_catches, Integer, null: false
    field :createdAt, String, null: true
    field :updatedAt, String, null: true

    field :rank, Integer, null: false
    def rank
      object.id
    end

  end
end
