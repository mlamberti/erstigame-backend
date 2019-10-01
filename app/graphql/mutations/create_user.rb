module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :group_token, String, required: true
    argument :gender, Types::GenderEnum, required:false
    argument :info, String, required:false


    field :auth_token, String, null: true
    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(name:, group_token:, gender:nil, info:nil )
      user = User.new(
        name: name,
        group: Group.find_by(join_token: group_token)
      )

      context[:current_user]&.invalidate

      if context[:pundit].authorize(user, :create?).save
        { user: user, auth_token: user.auth_token }
      else
        { errors: user.errors.full_messages }
      end
    end
  end
end