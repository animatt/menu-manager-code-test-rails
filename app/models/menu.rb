class Menu < ApplicationRecord
  has_many :dishes

  validates :name, presence: true
  validates_associated :dishes
end
