FactoryBot.define do
  factory :motivation do
    association :user

    title             {'test'}
    purchase_date     {'2020-01-01'}
    purpose           {'test'}
    category_id        {2}
    
    after(:build) do |motivation|
      motivation.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end