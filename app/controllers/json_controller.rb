class JsonController < ApplicationController
  def index
    # different structure than the example problem but this one can be more easily validated
    # json = {
    #   menus: Menu.all.map do |menu|
    #     {
    #       name: menu.name,
    #       dishes: menu.dishes.map do |dish|
    #         {
    #           name: dish.name,
    #           price: dish.price,
    #           description: dish.description
    #         }
    #       end
    #     }
    #   end
    # }
    json = Hash[
      Menu.all.map do |menu|
        [
          menu.name, menu.dishes.map do |dish|
            {
              id: dish.id,
              name: dish.name,
              price: dish.price,
              description: dish.description
            }
          end
        ]
      end
    ]
    render json: json
  end
end
