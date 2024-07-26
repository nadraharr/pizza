class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin_role? || user.moderator_role?
  end

  def ban?
    user.admin_role? || user.moderator_role?
  end

  def destroy?
    user.admin_role?
  end

  def set_role?
    user.admin_role?
  end
end
