
class Medication < ApplicationRecord
  belongs_to :user
  belongs_to :interval
  has_many :medication_frequencies
end
