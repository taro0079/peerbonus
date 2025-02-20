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

  def amount_of_point
    get_amount_of_point_increase - get_amount_of_point_decrease
  end

  def give_point_to(user, amount)
    PointDecrease.create(user_id: id, amount: amount)
    PointIncrease.create(user_id: user.id, amount: amount)
  end

  def name
    "#{last_name} #{first_name}"
  end

  private

  def point_must_be_zero_or_more
    if amount_of_point < 0
      errors.add(:base, "point must be zero or more")
    end
  end
end
