module Types
  class GenderEnum < BaseEnum
    User.genders.keys.each do |gender|
      value gender.to_s.upcase, value: gender
    end
  end
end
