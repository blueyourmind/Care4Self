# app/models/user.rb
class User < ApplicationRecord
  include Noticed::Model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :medications
  has_many :notifications, dependent: :destroy
  has_one :recipient
  # belongs_to :recipient, optional: true
  attribute :user_type, :string
  attribute :scheduled_medication_time, :time


  # def notify(message)

  #   Notification.with(message: message).deliver(self)
  # end
end
