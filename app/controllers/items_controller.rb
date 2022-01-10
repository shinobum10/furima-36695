class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index 
    @items = Item.order(id: "DESC")
  end

  def new
    @item = Item.new 
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
  
  def destroy
    if current_user.id == @item.user_id
       @item.destroy
    end
       redirect_to root_path
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

  def update
    @item.update(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :cost_id, :duration_id, :prefecture_id, :category_id, :brand_id, :user, :image).merge(user_id: current_user.id)
  end

  def set_item
   @item = Item.find(params[:id])
  end
end

