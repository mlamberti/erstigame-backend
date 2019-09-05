module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :group, GroupType, null: false
    field :name, String, null: false
    field :info, String, null: true
    field :picture, String, null: true
    field :createdAt, String, null: true
    field :updatedAt, String, null: true
    field :photos, [PhotoType], null: true
  end
end