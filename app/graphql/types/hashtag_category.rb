module Types
  class HashtagCategory < BaseEnum
    Hashtag.categories.keys.each do |category|
      value category.to_s.upcase, value: category
    end
  end
end
