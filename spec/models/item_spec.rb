require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it "全ての項目の入力が存在すれば登録できること" do
        @item
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it "ユーザーの情報がない場合登録できないこと" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "imageが空の場合は登録できないこと" do 
        @item.image = nil 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "productsが空の場合は登録できないこと" do 
        @item.products = '' 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Products can't be blank")
      end

      it "textが空の場合は登録できないこと" do 
        @item.text = '' 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      
      it "category_idが1の場合は登録できないこと" do 
        @item.category_id = 1
        @item.valid? 
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "status_idが1の場合は登録できないこと" do 
        @item.status_id = 1 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "shipping_fee_status_idが1の場合は登録できないこと" do 
        @item.shipping_fee_status_id = 1 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end

      it "prefecture_idが1の場合は登録できないこと" do 
        @item.prefecture_id = 1 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "scheduled_delivery_idが1の場合は登録できないこと" do 
        @item.scheduled_delivery_id = 1 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end


      it "priceが空の場合は登録できないこと" do 
        @item.price = '' 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが300以下の場合は登録できないこと" do 
        @item.price = 299
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceが10000000以上の場合は登録できないこと" do 
        @item.price = 10000000 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceが全角数字の場合は登録できないこと" do 
        @item.price = '５００'
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが英字の場合は登録できないこと" do 
        @item.price = 'abc' 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが半角英数混合の場合は登録できないこと" do 
        @item.price = 'abc123' 
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end