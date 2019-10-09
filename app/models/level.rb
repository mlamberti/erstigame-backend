class Level < ApplicationRecord
  has_many :groups
  has_many :hashtags
  has_many :required_hashtags, foreign_key: :required_by_level_id, class_name: "Hashtag"

  def self.seed
    seeds = [
      {rank: 0, num_hours: 0, num_places: 0, num_sponsors: 0, num_catches: 0},
      {rank: 1, num_hours: 0, num_places: 0, num_sponsors: 0, num_catches: 0},
      {rank: 2, num_hours: 5, num_places: 1, num_sponsors: 0, num_catches: 0},
      {rank: 3, num_hours: 25, num_places: 3, num_sponsors: 0, num_catches: 0},
      {rank: 4, num_hours: 50, num_places: 5, num_sponsors: 0, num_catches: 2},
      {rank: 5, num_hours: 100, num_places: 7, num_sponsors: 0, num_catches: 4},
      {rank: 6, num_hours: 200, num_places: 8, num_sponsors: 0, num_catches: 6},
      {rank: 7, num_hours: 300, num_places: 10, num_sponsors: 0, num_catches: 8},
      {rank: 8, num_hours: 400, num_places: 12, num_sponsors: 0, num_catches: 10},
      {rank: 9, num_hours: 500, num_places: 12, num_sponsors: 0, num_catches: 10},
      {rank: 10, num_hours: 600, num_places: 12, num_sponsors: 0, num_catches: 10},
      {rank: 11, num_hours: 700, num_places: 12, num_sponsors: 0, num_catches: 10},
      {rank: 12, num_hours: 1000, num_places: 12, num_sponsors: 0, num_catches: 10},
    ]

    seeds.each do |seed|
      level = self.find_by rank: seed[:rank]
      level&.update seed

      self.create(seed) unless level
    end
  end

end
