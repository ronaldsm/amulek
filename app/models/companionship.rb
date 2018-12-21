class Companionship < ApplicationRecord
  has_many :appointments
  validates :label, presence: true
end
