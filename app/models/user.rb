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

  def profile_picture
    if photo.attached?
      photo
    else
      "robot.png"
    end
  end

  # <% if current_user.photo.attached? %>
  #           <%= image_tag current_user.photo, class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false %>
  #         <% else %>
  #           <%= image_tag "robot.png", class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false %>
  #         <% end %>
end
