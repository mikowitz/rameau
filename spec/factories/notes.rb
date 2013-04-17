FactoryGirl.define do
  factory :note, class: Rameau::Note do
    pitch { build(:pitch) }
    duration 1
    initialize_with { new(pitch, duration) }
  end
end
