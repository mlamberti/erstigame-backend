module Types
  class RallyeStationType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :tag, String, null: false
    field :name, String, null: false
    field :points, Integer, null: true

    def points
      return unless context[:current_user]

      object.rallye_ratings.find_by(group: context[:current_user].group).points
    end

  end
end
