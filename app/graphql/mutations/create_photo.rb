module Mutations
  class CreatePhoto < BaseMutation
    argument :people_count, Integer, required: true
    argument :hashtag_ids, [ID], required: true, loads: Types::HashtagType
    argument :picture, ApolloUploadServer::Upload, required: true

    field :photo, Types::PhotoType, null: true
    field :errors, [String], null: true

    def resolve(people_count:, hashtags:, picture:)
      photo = Photo.new(
        user: context[:current_user],
        group: context[:current_user].group,
        people_count: people_count,
        hashtags: hashtags
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
