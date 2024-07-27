class MealPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.admin_role? || user.moderator_role?
  end

  def create?
    user.admin_role? || user.moderator_role?
  end

  def edit?
    user.admin_role? || user.moderator_role?
  end

  def update?
    user.admin_role? || user.moderator_role?
  end

  def destroy?
    user.admin_role? || user.moderator_role?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
