FactoryBot.define do
  factory :order_address do
    postcode            {'123-4567'}
    prefecture_id       {4}
    city                {'市'}
    block               {'町'}
    building            {'胃'}
    phone_number        {'1234567890'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
