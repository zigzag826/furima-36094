require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user, email: 'test@test')
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '商品購入機能' do
    context '商品が購入できる場合' do
      it '必須の情報が登録されていれば購入できること' do
        @order
        expect(@order).to be_valid
      end

      it 'buildingが空でも購入できること' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'user情報がない場合は購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item情報がない場合は購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it 'postcodeがからの場合は購入できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeに-が入っていないと購入できないこと' do
        @order.postcode = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode is invalid")
      end

      it 'prefecture_idがからの場合は購入できないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが１の場合は購入できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空の場合は購入できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空の場合は購入できないこと' do
        @order.block = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空の場合は購入できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberに-が含まれていると購入できないこと' do
        @order.phone_number = '123-4567-8901'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberに全角数字が含まれる場合は購入できないこと' do
        @order.phone_number = '１２３４５６７８９０'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberに英字が含まれる場合は購入できないこと' do
        @order.phone_number = 'ABC1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが９桁以下だと購入できないこと' do
        @order.phone_number = 123456789
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが１２桁以上だと購入できないこと' do
        @order.phone_number = 123456789012
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end