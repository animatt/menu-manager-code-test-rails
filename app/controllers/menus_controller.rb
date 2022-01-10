class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create(**permitted_params)

    redirect_to menus_path
  end

  private

  def permitted_params
    params.require(:menu).permit(:name)
  end
end
