FactoryBot.define do
    
    factory :labwork do

        association :user
        title { FFaker::Book.title }
        description { FFaker::Lorem.sentence }

    end

end