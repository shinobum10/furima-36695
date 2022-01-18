class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @purchase_records = PurchaseAddress.new 
    @item = Item.find(params[:item_id])
    if  (current_user.id == @item.user_id) || @item.purchase_record.present?
      redirect_to root_path
    end
  end 

  def new
    @purchase_records = PurchaseAddress.new
  end
  
  
  def create
    @item = Item.find(params[:item_id])
    @purchase_records = PurchaseAddress.new(purchase_address_params)
    if @purchase_records.valid?
      Payjp.api_key = "sk_test_1d1072910ccd581665c54c8b"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
       @purchase_records.save
       redirect_to root_path
    else
      render :index
    end
  end
  
    
    private
     def purchase_address_params
      @item = Item.find(params[:item_id])
      params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building_id, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
     end

    #  ①form_withの modelを指定して二重にする→requireに指定
    #  ②今一重のデータのキーをそれぞれpermitに指定
    #  ③paramsに含まれていないけど必要なデータをmargeする
end

  