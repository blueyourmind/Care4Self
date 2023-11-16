class User < ApplicationRecord
  has_many :notifications, as: :recipient
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :medications

  # validates :name, presence: true
  # validates :phone_number, presence: true, format: { with: /\A\d{10}\z/ }
  # validates :family_phone_number, presence: true, format: { with: /\A\d{10}\z/ }
  # validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
end
