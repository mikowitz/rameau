FactoryGirl.define do
  factory :pitch_class, class: Rameau::PitchClass do
    natural_degree 0
    initialize_with { new(natural_degree) }
  end
end
