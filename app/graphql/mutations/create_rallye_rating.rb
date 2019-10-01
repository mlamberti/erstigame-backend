module Mutations
  class CreateRallyeRating < BaseMutation
    argument :group_id, ID, required: true
    argument :station_token, String, required: true
    argument :points, Integer, required: true

    field :rallye_rating, Types::RallyeRatingType, null: true
    field :errors, [String], null: true

    def resolve(group_id:, station_token:, points: )
      group = ErstigameBackendSchema.object_from_id(group_id, context) 
      return { errors: ["Group not found. #{group_id}"] } unless group
      station = RallyeStation.find_by token: station_token
      return { errors: ["Station not found."] } unless station

      rating = group.rallye_ratings.find_by rallye_station: station
      if rating
        rating.points = points
        rating.save
      else
        rating = RallyeRating.create group: group, rallye_station: station, points: points
      end

      if rating.errors.empty?
        { rallye_rating: rating }
      else
        { errors: rating.errors.full_messages }
      end
    end
  end
end