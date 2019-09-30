class UserPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where group_id: user.group_id
    end
  end

  def index?
    user.present?
  end

  def show?
    record.group_id == user.group_id
  end

  def create?
    !user.present?
  end

end