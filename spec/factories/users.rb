FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'1234abc'}
    password_confirmation {password}
    last_name             {'阿'}
    first_name            {'意'}
    last_name_kana        {'ア'}
    first_name_kana       {'イ'}
    birthday              {'2000-01-01'}
  end
end