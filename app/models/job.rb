class Job < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  def done?
    !finish_date.nil?
  end
end
