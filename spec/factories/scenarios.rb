# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scenario do
    name "MyString"
    description "MyText"
    feature_id 1
    position 1
  end
end
