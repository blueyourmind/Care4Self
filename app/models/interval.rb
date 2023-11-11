class Interval < ApplicationRecord
  has_many :medications
  validates :name, presence: true
  validates :value, presence: true
end
