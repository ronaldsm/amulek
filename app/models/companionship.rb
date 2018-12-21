class Companionship < ApplicationRecord
  has_many :appointments, dependent: :destroy
  validates :label, presence: true
end
