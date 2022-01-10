class DishesController < ApplicationController
  def index
    @dishes = Dish.all
    @errors = params.permit(errors: [])[:errors] || []
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.create(**create_params)

    redirect_to dishes_path(errors: @dish.errors.full_messages)
  end

  private

  def create_params
    params.require(:dish).permit(:name, :price, :description, :menu_id)
  end
end
