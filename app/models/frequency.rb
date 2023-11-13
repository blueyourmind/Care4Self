class Frequency < ApplicationRecord
  has_many :medication_frequencies
  has_many :medications, through: :medication_frequencies
  validates :name, presence: true
  validates :value, presence: true
  validates :description, presence: true
end
