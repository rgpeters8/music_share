FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    sequence(:username) { |n| "person#{n}"}
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
    
  end
  
  factory :post do
      user
      description "Lorem ipsum"
      title "Test Post"
      play_count 0
      playlist "exampleList"
      youtube_id "FVUSFVdmvYQ"
      category "Other"
      
    end
end

