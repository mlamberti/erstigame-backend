module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :group_token, String, required: true
    argument :gender, String, required:false
    argument :info, String, required:false


    field :token, String, null: true
    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(name: nil, group_token: nil)
      user = User.new(
        name: name,
        group: Group.find_by(join_token: group_token)
      )

      if context[:pundit].authorize(user, :create?).save
        { user: user, token: user.auth_token }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end