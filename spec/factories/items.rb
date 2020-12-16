FactoryBot.define do
  factory :item do
    name                {Faker::Name.initials(number: 2)}
    text                {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from: 1, to: 10)}
    state_id            {Faker::Number.between(from: 1, to: 6)}
    delivery_charge_id  {Faker::Number.between(from: 1, to: 2)}
    area_id             {Faker::Number.between(from: 1, to: 47)}
    send_date_id        {Faker::Number.between(from: 1, to: 3)}
    price               {Faker::Number.between(from: 300, to: 9999999)}
    association :user 
   
    
   

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end