class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.job.owner == user
  end

  def update?
    # record.sitter == user
    true
  end
end
