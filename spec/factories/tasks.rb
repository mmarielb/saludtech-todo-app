FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    estimated_minutes { 1 }
    completed { false }
    due_date { "2025-08-28" }
  end
end
