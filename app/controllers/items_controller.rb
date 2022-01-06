class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
 # before_action :set_item, only: [:index, :create, :new]
  
  def index 
    @items = Item.order(id: "DESC")
  end

  def new
    @item = Item.new 
  end
  
  
  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
       redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :cost_id, :duration_id, :prefecture_id, :category_id, :brand_id, :user, :image).merge(user_id: current_user.id)
  end

  # def set_item
  #  @item = Item.find(params[:id])
  # end
  
end

