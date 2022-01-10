class Dish < ApplicationRecord
  belongs_to :menu, optional: true

  validates :name, presence: true
  validates :price, presence: true
  validates :name, format: { without: /\AE/, message: 'name cannot begin with E' }

  validates_with Validator::NoDuplicateDishValidator
  validates_with Validator::PriceSumValidator
end
