module Types
  class PhotoType < BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :group, GroupType, null: false
    field :user, UserType, null: false
    field :date, String, null: false
    field :hashtags, [HashtagType], null: false
    field :peopleCount, Integer, null: false
    field :points, Integer, null: false
    field :createdAt, String, null: true
    field :updatedAt, String, null: true

    field :path, String, null: false
    def path
        Rails.application.routes.url_helpers.rails_blob_path object.picture, only_path: true
    end
  end
end
