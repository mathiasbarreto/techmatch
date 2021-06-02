class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user && !record.fulfilled?
  end

  def destroy?
    record.user == user && !record.fulfilled?
  end
end
