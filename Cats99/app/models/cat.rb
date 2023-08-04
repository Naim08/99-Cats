class Cat < ApplicationRecord
  VALID_COLORS = %w(orange brown white black)
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a valid sex" }
  validates :color, inclusion: { in: VALID_COLORS, message: "%{value} is not a valid color"}
  validate :birth_date_cannot_be_the_future 
  


  def birth_date_cannot_be_the_future
    if birth_date > Date.today
      errors.add(:birth_date, "can't be in the future")
    end
  end

end
