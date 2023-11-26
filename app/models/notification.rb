class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :user, polymorphic: true
  # belongs_to :account, class_name: 'User'
  attribute :scheduled_at, :datetime
  # belongs_to :recipient, class_name: 'User'
  attribute :post, :string
  attribute :user_id, :integer
  attribute :med_type, :string
end
