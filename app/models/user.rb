class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers
  has_many :jobs
  has_one_attached :photo

  validates :username, uniqueness: true, presence: true

  def employer_rating_avg
    return "Not rated yet" if jobs.empty?

    total_rating = jobs.reduce(0.0) { |total, job| job.employer_rating.nil? ? total : total += job.employer_rating }
    avg = total_rating / jobs.reject { |job| job.employer_rating.nil? }.size
    avg.nan? ? "Not Rated yet" : avg
  end

  def contractor_rating_avg
    return "Not rated yet" if jobs.empty?

    total_rating = jobs.reduce(0.0) { |total, job| job.contractor_rating.nil? ? total : total += job.contractor_rating }
    avg = total_rating / jobs.reject { |job| job.contractor_rating.nil? }.size
    avg.nan? ? "Not rated yet" : avg
  end

  def profile_picture
    photo.attached? ? photo : 'robot.png'
  end
end
