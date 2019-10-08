module Mutations
  class CreatePhoto < BaseMutation
    argument :picture, ApolloUploadServer::Upload, required: true
    argument :people_count, Integer, required: true
    argument :hashtag_ids, [ID], required: true, loads: Types::HashtagType
    argument :date, GraphQL::Types::ISO8601DateTime, required: false

    field :photo, Types::PhotoType, null: true
    field :errors, [String], null: true

    def resolve(picture:, people_count:, hashtags:, date: nil)
      photo = Photo.new(
        user: context[:current_user],
        group: context[:current_user].group,
        people_count: people_count,
        hashtags: hashtags,
        date: date
      )

      photo.picture.attach(io: picture.to_io, filename:  picture.original_filename)
      if context[:pundit].authorize(photo, :create?).save
        { photo: photo }
      else
        { errors: photo.errors.full_messages }
      end
    end
  end
end
