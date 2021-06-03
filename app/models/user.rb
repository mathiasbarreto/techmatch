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
    unless jobs.empty?
      total = jobs.reduce(0.0) { |total, job| job.employer_rating.nil? ? total : total += job.employer_rating }
      total / jobs.select { |job| not job.employer_rating.nil? }.size
    end
  end

  def contractor_rating_avg
    unless jobs.empty?
      total = jobs.reduce(0.0) { |total, job| job.contractor_rating.nil? ? total : total += job.contractor_rating }
      total / jobs.select { |job| not job.contractor_rating.nil? }.size
    end
  end

  def profile_picture
    photo.attached? ? photo : 'robot.png'
  end
end
