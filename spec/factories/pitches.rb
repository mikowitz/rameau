FactoryGirl.define do
  factory :pitch, class: Rameau::Pitch do
    pitch_class { build(:pitch_class) }
    octave 4
    initialize_with { new(pitch_class, octave) }
  end
end
