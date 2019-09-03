class Student < ApplicationRecord
  validates :name, presence: true
  validates :mod, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  has_many :ducks
end
