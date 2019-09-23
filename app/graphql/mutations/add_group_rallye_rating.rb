module Mutations
  class AddGroupRallyeRating < BaseMutation
    argument :token, String, required: true

    field :rallye_rating, Types::RallyeRatingType, null: true
    field :errors, [String], null: true

    def resolve(token: nil)
      rating = RallyeRating.find_by(token: token)
      group = context[:current_user].group

      if group.rallye_ratings << rating
        { rallye_rating: rating }
      else
        { errors: group.errors.full_messages }
      end
    end
  end
end
