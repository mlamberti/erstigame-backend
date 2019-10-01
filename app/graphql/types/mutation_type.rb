module Types
  class MutationType < BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_photo, mutation: Mutations::CreatePhoto
    field :create_rallye_rating, mutation: Mutations::CreateRallyeRating
  end
end