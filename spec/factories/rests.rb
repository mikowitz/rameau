FactoryGirl.define do
  factory :rest, class: Rameau::Rest do
    duration 1
    initialize_with { new(duration) }
  end
end
