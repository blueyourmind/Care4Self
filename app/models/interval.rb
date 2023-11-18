class Interval < ApplicationRecord
  has_many :medications
  validates :value, presence: true
end
