class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_records = PurchaseAddress.new 
    if  (current_user.id == @item.user_id) || @item.purchase_record.present?
      redirect_to root_path
    end
  end 

  def create
    @purchase_records = PurchaseAddress.new(purchase_address_params)
    if @purchase_records.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
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
    def set_item
      @item = Item.find(params[:item_id])
    end
     
    def purchase_address_params
      params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building_id, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
    end

    #  ①form_withの modelを指定して二重にする→requireに指定
    #  ②今一重のデータのキーをそれぞれpermitに指定
    #  ③paramsに含まれていないけど必要なデータをmargeする
end

  