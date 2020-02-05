class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.owner == owner
  end

  def destroy?
    record.owner == owner
  end


  def show?
    true
  end
end
