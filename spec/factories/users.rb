FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
    sequence(:name) { |i| "User #{i}" }
    password "mysecretpass"
  end

  factory :administrator, class: User do
    email "administrator@example.com"
    name "Administrator Name"
    password "mysecretpass"
  end
end
