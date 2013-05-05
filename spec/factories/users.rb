FactoryGirl.define do
  factory :user do
    email "user@example.com"
    name "User Name"
    password "mysecretpass"
  end

  factory :administrator, class: User do
    email "administrator@example.com"
    name "Administrator Name"
    password "mysecretpass"
  end
end
