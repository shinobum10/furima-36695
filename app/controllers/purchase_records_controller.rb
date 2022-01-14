class PurchaseRecordsController < ApplicationController
  def index
    @purchase_records = PurchaseAddress.new 
    @item = Item.find(params[:item_id])
  end 

  def create
    @item = Item.find(params[:item_id])
   @purchase_records = PurchaseAddress.new(purchase_address_params)
   if @purchase_records.valid?
      @purchase_records.save
      redirect_to root_path
    else
      render :index
    end
    
     
  end
    
    
    private
     def purchase_address_params
      params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building_id, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
     end

    #  ①form_withの modelを指定して二重にする→requireに指定
    #  ②今一重のデータのキーをそれぞれpermitに指定
    #  ③paramsに含まれていないけど必要なデータをmargeする
end

  