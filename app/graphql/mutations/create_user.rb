module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :group_token, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(name: nil, group_token: nil)

      group = Group.find_by join_token: group_token

      user = User.new(
        name: name,
        group: group
      )

      if context[:pundit].authorize(user, :create?).save
        { user: user, token: user.auth_token }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end