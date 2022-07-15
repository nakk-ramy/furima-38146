class MemoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
    @order_memory = OrderMemory.new
  end

  def create
    @order_memory = OrderMemory.new(memory_params)
    if @order_memory.valid?
      pay_item
      @order_memory.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def memory_params
    params.require(:order_memory).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], memory_id: Memory, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: memory_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user || !@item.memory.nil?
  end
end
