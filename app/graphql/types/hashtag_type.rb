module Types
  class HashtagType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    field :id, ID, null: false
    field :name, String, null: false
    field :info, String, null: false
    field :points, Integer, null: false
    field :description, String, null: true
    field :picture, String, null: true
    field :repeatTime, String, null: true
  end
end
