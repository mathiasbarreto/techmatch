class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers
  has_many :jobs

  validates :username, uniqueness: true, presence: true

  def employer_rating_avg
    avg = 0
    unless jobs.empty?
      jobs.each { |job| avg += job.employer_rating }
      avg /= jobs.size
    end
    return avg
  end

  def contractor_rating_avg
    avg = 0
    unless jobs.empty?
      jobs.each { |job| avg += job.contractor_rating }
      avg /= jobs.size
    end
    return avg
  end
end
