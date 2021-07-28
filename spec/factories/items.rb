FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end

    products                   {'テスト１'}
    text                       {'商品説明です'}
    category_id                {'2'}
    status_id                  {'2'}
    shipping_fee_status_id     {'2'}
    prefecture_id              {'2'}
    scheduled_delivery_id      {'2'}
    price                      {'500'}
  end
end
