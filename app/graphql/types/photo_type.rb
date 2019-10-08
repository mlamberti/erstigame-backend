module Types
  class PhotoType < BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :group, GroupType, null: false
    field :user, UserType, null: false
    field :date, String, null: false
    field :hashtags, [HashtagType], null: false
    field :peopleCount, Integer, null: false
    field :path, String, null: false
    field :url, String, null: false
    field :points, Integer, null: false
    field :numHours, Float, null: false
    field :numCatches, Integer, null: false
    field :numPlaces, Integer, null: false
    field :numSponsors, Integer, null: false
    field :createdAt, String, null: true
    field :updatedAt, String, null: true
  end
end
