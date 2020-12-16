class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: :new
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :text, :state_id, :delivery_charge_id, :area_id, :send_date_id, :image).merge(user_id: current_user.id)
  end

end
