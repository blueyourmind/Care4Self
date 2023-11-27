# app/models/recipient.rb
class Recipient < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :users, dependent: :destroy
end

