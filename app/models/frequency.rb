class Frequency < ApplicationRecord
  has_many :medication_frequencies
  validates :name, presence: true
  validates :value, presence: true
end
