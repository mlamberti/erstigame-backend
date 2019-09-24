module Types
  class HashtagType < Types::BaseObject
    implements GraphQL::Relay::Node.interface
    global_id_field :id

    field :name, String, null: false
    field :info, String, null: false
    field :points, Integer, null: false
    field :description, String, null: true
    field :picture, String, null: true
    field :repeatTime, String, null: true
    field :level, LevelType, null: true
    field :category, HashtagCategory, null: true
    field :createdAt, String, null: true
    field :updatedAt, String, null: true

    field :repeatable, Boolean, null: false
    def repeatable
      !object.repeat_time.nil?
    end

    field :done, Boolean, null: true
    def done
      return unless context[:current_user]
      #object.photos.exists? group_id: context[:current_user].group_id
      Photo.find_by(group_id: context[:current_user].group_id)&.hashtags&.exists? id
    end
  end
end
