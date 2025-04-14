class Fitlog < ApplicationRecord
  belongs_to :user

  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999.9 }
  validates :body_fat, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99.9 }, allow_nil: true
  validates :muscle, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999.9 }, allow_nil: true
  validates :bmr, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9999.9 }, allow_nil: true
  validates :body_age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }, allow_nil: true
  validates :memo, length: { maximum: 30 }, allow_nil: true
  validates :record_at, presence: true, uniqueness: { scope: :user_id }

  scope :recent, -> { order(created_at: :desc).limit(14) }
end
