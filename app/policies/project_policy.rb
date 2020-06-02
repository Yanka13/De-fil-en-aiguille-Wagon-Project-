class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end
  def new?
    true
  end

  def show?
    true  # Anyone can view a project
  end

  def create?
    true  # Anyone can create a project
  end

  def update?
    record.user == user  # Only project creator can update it
  end

  def destroy?
    record.user == user  # Only brain project can delete it
  end

end
