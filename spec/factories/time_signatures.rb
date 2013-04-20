FactoryGirl.define do
  factory :time_signature, class: Rameau::TimeSignature do
    beats 2
    subdivision 4
    initialize_with { new(beats, subdivision) }
  end
end
