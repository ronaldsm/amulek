class Appointment < ApplicationRecord
  belongs_to :companionship
  validates :date, presence: true
  validates :family, presence: true
end
