module Types
  class UserType < BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :group, GroupType, null: false
    field :name, String, null: false
    field :info, String, null: true
    field :picture, String, null: true
    field :photos, [PhotoType], null: true
    field :gender, GenderEnum, null: true
    field :invalidated, Boolean, null: false

    field :createdAt, String, null: true
    field :updatedAt, String, null: true
  end
end