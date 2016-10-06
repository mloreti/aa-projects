require 'date'

class Cat < ActiveRecord::Base
  validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a gender..." }
  validates :birth_date, :color, :sex, :name, :description, presence: true

  has_many :rentals,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRental,
    dependent: :destroy

  def age
    birth_year = self.birth_date.year
    today_year = Date.today.year
    today_year - birth_year
  end
end
