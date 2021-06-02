class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.user == user && !record.offer.fulfilled?
  end

  def show?
    record.user == user || record.offer.user == user
  end
end
