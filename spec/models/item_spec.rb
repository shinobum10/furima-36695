require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it "@item全て入力すれば登録できる" do
        expect(@item).to be_valid
         end
    end

    context "商品出品できない場合" do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空では登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "価格情報が無いと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格は半角数値でないと登録できない" do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "価格が299円以下では登録できない" do
        @item.price = 299  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "価格が1,000,000円以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "cost_idが未選択では登録できない" do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it "duration_idが未選択では登録できない" do
        @item.duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Duration can't be blank")
      end
      it "prefecture_idが未選択では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cotegory_idが未選択では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "brand_idが未選択では登録できない" do
        @item.brand_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Brand can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end 
  end  
end
