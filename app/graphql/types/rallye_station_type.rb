module Types
  class RallyeStationType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :name, String, null: false
    field :tag, String, null: false
    field :rallye_ratings, [RallyeRatingType], null: false
    field :all_groups, [GroupType], null: false
    def all_groups
      Group.all.order :number
    end

  end
end
