class Student < ApplicationRecord
  has_many :ducks

  validates :name, presence: true
  validates :mod, presence: true
  validate :validate_mod
  
  def validate_mod
    if !self.mod.to_i.between?(1,5)
      errors.add(:mod, " must be between 1 and 5")
    end
  end

# 

end
