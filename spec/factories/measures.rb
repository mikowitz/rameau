FactoryGirl.define do
  factory :measure, class: Rameau::Measure do
    time_signature { build(:time_signature) }
    contents []
    initialize_with { new(time_signature, *contents) }
  end
end
