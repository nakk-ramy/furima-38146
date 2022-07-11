class ItemsController < ApplicationController
  def new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
