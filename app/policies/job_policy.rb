class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def review_employer?
    record.user == user
  end

  def review_employer?
    record.user == user
  end
  def create?
    record.user == user
  end

  def show?
    record.user == user
  end
end
