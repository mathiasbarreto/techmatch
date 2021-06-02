class Job < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :contractor_rating, numericality: { allow_nil: true, greater_than: 0, less_than_or_equal_to: 10 }

  def done?
    !finish_date.nil?
  end
end
