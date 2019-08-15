module Types
  class GroupType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :users, [UserType], null: false
  end
end