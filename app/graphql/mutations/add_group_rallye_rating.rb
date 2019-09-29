module Mutations
  class AddGroupRallyeRating < BaseMutation
    argument :token, String, required: true
    argument :group, String, required: true
    argument :points, String, required: true

    field :errors, [String], null: true

    def resolve(token, group, points)
      station = RallyeStation.find_by(token: token)
      return { errors: ["Station not found"] } unless station

      rating = group.rallye_ratings.find_by rallye_station: station

      if !rating
        group.rallye_ratings << RallyeRating.create(group: group, station: station, point: points)
      else
        rating.points = points
        rating.save!
      end

      { errors: rating&.errors.full_messages }
    end
  end
end
