class SitterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    true
    # record.sitter == sitter
  end
end「「
