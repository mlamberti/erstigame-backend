module Types
  class MutationType < BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_photo, mutation: Mutations::CreatePhoto
    field :add_group_rallye_rating, mutation: Mutations::AddGroupRallyeRating
  end
end