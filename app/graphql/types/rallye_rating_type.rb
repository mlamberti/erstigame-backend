module Types
  class RallyeRatingType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :points, Integer, null: false
    field :rallye_station, RallyeStationType, null: false

  end
end
