class PointDecrease < ApplicationRecord
  belongs_to :user

  validate :point_must_be_zero_or_more

  private

  def point_must_be_zero_or_more
    if user.amount_of_point < 0
      errors.add(:base, 'point must be zero or more')
    end
  end
end
