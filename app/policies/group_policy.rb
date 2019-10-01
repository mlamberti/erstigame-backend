class GroupPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where group_id: user.group_id
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end

end