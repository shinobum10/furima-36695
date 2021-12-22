class ItemsController < ApplicationController
  def index
  end

 def new
  Item.create(item_params) 
 end
  
  private
def item_params
    params.require(:item).permit(:name, :price, :description, :cost_id, :duration_id, :prefecture_id, :category_id, :brand_id, :user, :image).merge(user_id: current_user.id)
end
