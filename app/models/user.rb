class User < ApplicationRecord
  has_many :point_increases

  def get_amount_of_point_increase
    self.point_increases.reduce(0) { |sum, point_increase | sum + point_increase.amount }
  end
end
