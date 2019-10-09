module Mutations
  class CreateGroup < BaseMutation
    argument :name, String, required: true

    field :join_token, String, null: true
    field :group, Types::GroupType, null: true
    field :errors, [String], null: true

    def resolve(name:)
      group = Group.new(
        name: name,
      )

      if group.save
        { group: group, join_token: group.join_token }
      else
        { errors: group.errors.full_messages }
      end
    end
  end
end
