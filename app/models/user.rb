class User < ApplicationRecord
  has_many :point_increases
  has_many :point_decreases

  validate :point_must_be_zero_or_more

  def get_amount_of_point_increase
    self.point_increases.reduce(0) { |sum, point_increase | sum + point_increase.amount }
  end

  def get_amount_of_point_decrease
    self.point_decreases.reduce(0) { |sum, point_increase | sum + point_increase.amount }
  end

  def get_amount_of_point
    self.get_amount_of_point_increase - self.get_amount_of_point_decrease
  end

  private

  def point_must_be_zero_or_more
    if get_amount_of_point < 0
      error.add(:base, 'point must be zero or more')
    end
  end
end
