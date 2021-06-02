class Offer < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def fulfilled?
    Job.exists?(offer_id: self.id)
  end
end
