# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :medications
  has_many :notifications, dependent: :destroy
  # has_one :recipient
  # belongs_to :recipient, optional: true
  attribute :user_type, :string
  attribute :scheduled_medication_time, :time

end
