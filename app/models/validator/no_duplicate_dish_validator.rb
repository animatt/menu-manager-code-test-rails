module Validator
  class NoDuplicateDishValidator < ActiveModel::Validator
    def validate(record)
      other_record = Dish.where(name: record.name).where('menu_id is not null')
      if other_record.present?
        record.errors.add(:base, 'The same dish name cannot be used in two or more menus')
      end
    end
  end
end
