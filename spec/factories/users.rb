FactoryGirl.define do
  factory :user do
  end


  factory :valid_signup, parent: :user do
    username { Faker::Internet.user_name.downcase }
    email { Faker::Internet.safe_email }
    password {'abc123'}
  end

  factory :invalid_signup, parent: :valid_signup do
    username nil
    password nil
  end

end
