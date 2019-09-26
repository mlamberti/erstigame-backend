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

    field :repeatable, Boolean, null: true
    def repeatable
      repeatable_at&. <= Time.now
    end

    field :repeatable_at, String, null: true
    def repeatable_at
      return unless context[:current_user]
      return if object.repeat_time.nil?

      last_time = object.photos.where(group: context[:current_user].group).order(date: :desc).first&.date
      last_time ? last_time + object.repeat_time : Time.now
    end

    field :done, Boolean, null: true
    def done
      return unless context[:current_user]
      object.photos.exists? group: context[:current_user].group
    end

    field :doable, Boolean, null: true
    def doable
      !done || repeatable
    end
  end
end
