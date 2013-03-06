FactoryGirl.define do
  factory :user do
    email "wishlist@example.com"
    password "password"
    password_confirmation "password"

    factory :confirmed_user do
      email "confirmed@user.com"
      after_create do |user|
        user.confirm!
      end
    end
  end
end