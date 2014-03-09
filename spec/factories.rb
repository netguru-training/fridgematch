FactoryGirl.define do
  factory :ingredient do
    sequence :name do |n|
      "sample ingredient #{n}"
    end
  end

  factory :user do
    email 'sample@example.dev'
    password 'password'
    ingredients [FactoryGirl.build(:ingredient)]
  end


  factory :recipe do
    sequence :title do |n|
      "sample recipe #{n}"
    end
    url ''
    ingredients [FactoryGirl.build(:ingredient)]

  factory :nutritional_value do
    name "chicken breast"
    unit  "1 lbs"
    calories 1000
    carbohydrates 950
    fat 200
    protein 500

  end
end
