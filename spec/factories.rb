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
  end
end
