FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
    sequence(:name) { |i| "User #{i}" }
    password "mysecretpass"
  end

  factory :administrator, class: User do
    sequence(:email) { |i| "administrator#{i}@example.com" }
    sequence(:name) { |i| "Administrator #{i}" }
    administrator true
    password "mysecretpass"
  end
end
