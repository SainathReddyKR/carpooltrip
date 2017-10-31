FactoryGirl.define do

  factory :existing, class: User do
    email "10@ait.asia"
    username "10Abc"
    password "$2a$10$JmVX9EHDOEIunvkS2O26W.Q9Bm.EmEir4Gpv8AxyNG9Uo8FUfqxVC"
  end

  factory :user, class: User do
    email "2@ait.asia"
    username "2123"
    password "password"
    password_confirmation "password"
  end

  factory :existing1, class: User do
    email "admin123@ait.asia"
    username "aitadmin"
    password "000000"
    role_id "2"
  end

  factory :existing1member, class: Role do
    id "2"
    name "Member"
  end

end
