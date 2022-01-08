class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show]
  
  def index 
    @items = Item.all
    @items = Item.order(id: "DESC")
  end

  def new
    if user_signed_in?
       @item = Item.new 
    else
       redirect_to user_session_path(@item.id)
    end
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end
  
  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   redirect_to root_path
  #end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
       redirect_to items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :cost_id, :duration_id, :prefecture_id, :category_id, :brand_id, :user, :image).merge(user_id: current_user.id)
  end

  def set_item
   @item = Item.find(params[:id])
  end
  
end

