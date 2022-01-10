module Validator
  class PriceSumValidator < ActiveModel::Validator
    def validate(record)
      menu = record.menu
      return if menu.nil?

      sum_of_other_dishes = menu.dishes.sum(:price)
      if sum_of_other_dishes + record.price == 77
        record.errors.add(:base, 'The price of all dishes in a menu cannot equal 77')
      end
    end
  end
end
