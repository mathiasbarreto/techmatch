class Offer < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def fulfilled?
    Job.exists?(offer_id: id)
  end
end
