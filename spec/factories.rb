FactoryGirl.define do
  factory :user do
    name     "Example User"
    email    "example@example.com"
    username "exampleUser"
    password "foobar"
    password_confirmation "foobar"
  end
end