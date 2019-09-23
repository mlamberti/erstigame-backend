module Mutations
  class AddGroupRallyeRating < BaseMutation
    argument :token, String, required: true

    field :rallye_rating, Types::RallyeRatingType, null: true
    field :errors, [String], null: true

    def resolve(token: nil)
      rating = RallyeRating.find_by(token: token)
      return { errors: ["Rating not found"] } unless rating

      group = context[:current_user].group

      begin
        group.rallye_ratings << rating
      rescue ActiveRecord::RecordNotUnique
        return { errors: ["Rating already exists"] }
      end

      { rallye_rating: rating }
    end
  end
end
