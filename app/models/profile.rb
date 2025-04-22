class Profile < ApplicationRecord
  belongs_to :user

  validates :name, length: { maximum: 20 }, allow_nil: true
  validates :height, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 299.9 }, allow_nil: true
  validates :target_weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 299.9 }, allow_nil: true
end
