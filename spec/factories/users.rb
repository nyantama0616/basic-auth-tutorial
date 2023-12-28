FactoryBot.define do
  factory :user do
    user_id {"test_user"}
    password {"password"}
  end

  factory :hello_user, class: User do
    user_id {"hello_user"}
    password {"password"}
  end
end
