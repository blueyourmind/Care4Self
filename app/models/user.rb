class User < ApplicationRecord
  include Noticed::Model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :medications
  has_many :notifications
  has_one :recipient
  belongs_to :recipient, optional: true
  attribute :user_type, :string
  attribute :scheduled_medication_time, :time
  # validates :name, presence: true
  # validates :phone_number, presence: true
  # validates :family_phone_number, presence: true
  # validates :email, presence: true
end
