module Types
  class PhotoType < BaseObject
    field :id, ID, null: false
    field :group, GroupType, null: false
    field :user, UserType, null: false
    field :path, String, null: false
    field :date, String, null: false
    field :hashtags, [HashtagType], null: false
    field :peopleCount, Integer, null: false
    field :points, Integer, null: false
    field :createdAt, String, null: true
    field :updatedAt, String, null: true
  end
end
