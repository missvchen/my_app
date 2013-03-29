FactoryGirl.define do
  factory :user do
    name            "Michael Hartl"
    display_name    "M. Hartl"
    email           "michael@example.com"
    password        "foobar"
    password_confirmation "foobar"
  end
end