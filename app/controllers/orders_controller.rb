class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  before_action :move_to_root

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save

      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:post_code, :area_id, :district, :area_code, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  def move_to_root
    redirect_to root_path if @item.order.present?
  end
end
