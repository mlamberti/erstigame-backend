module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :group_token, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(name: nil, group_token: nil)
      group = Group.find_by_join_token(group_token)

      return unless group

      user = User.create!(
        name: name,
        group: group
      )

      { user: user, token: user.auth_token }
    end
  end
end