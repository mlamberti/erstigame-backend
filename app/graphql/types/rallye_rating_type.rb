module Types
  class RallyeRatingType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :group, GroupType, null: false
    field :points, Integer, null: false

    field :station_name, String, null: false
    def station_name
      object.rallye_station.name
    end
  end
end
