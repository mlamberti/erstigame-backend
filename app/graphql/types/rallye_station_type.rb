module Types
  class RallyeStationType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :name, String, null: false
    field :rallye_ratings, [RallyeRatingType], null: false

  end
end
