require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入' do
    before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @destination = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
    end

    context '内容に問題ない場合'do
      it '@destinationすべての値が正しく入力されていれば保存できること' do
        expect(@destination).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @destination.building_id = ''
        expect(@destination).to be_valid
      end
    end


    context '内容に問題がある場合' do
      it 'post_codeが空だと購入できないこと' do
        @destination.post_code = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @destination.post_code = '1234567'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefectureを選択していないと購入できないこと' do
        @destination.prefecture_id = 1
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できないこと' do
        @destination.city = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できないこと' do
        @destination.address = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @destination.phone_number= ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では購入できないこと' do
        @destination.phone_number= '1234567'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上だと購入できないこと' do
        @destination.phone_number= '123456123456'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに半角数字以外が含まれている場合は購入できないこと' do
        @destination.phone_number= 'a1234567890'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと購入できないこと' do
        @destination.user_id = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @destination.item_id = nil
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できないこと' do
        @destination.token = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end