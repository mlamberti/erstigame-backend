Level.create!([
  {rank: 1, num_hours: 0, num_places: 0, num_sponsors: 0, num_catches: 0},
  {rank: 2, num_hours: 5, num_places: 1, num_sponsors: 0, num_catches: 0},
  {rank: 3, num_hours: 10, num_places: 3, num_sponsors: 2, num_catches: 1},
  {rank: 4, num_hours: 20, num_places: 0, num_sponsors: 6, num_catches: 3},
  {rank: 5, num_hours: 100, num_places: 0, num_sponsors: 10, num_catches: 6}
])

Group.create!([
  {name: "Einhörner", join_token: "f9EwJg3i3Wg853uzENvR9FUw", level: Level.third, points: 100, num_catches: 3, num_places: 1, num_sponsors: 2, time_together: 40},
  {name: "Eichhörnchen", join_token: "y7ixkbExLUJQwqEzmdZL7MRF", level: nil, points: 0, num_catches: 0, num_places: 0, num_sponsors: 0, time_together: 0},
  {name: "Einhörnchen", join_token: "tKBnZa5c9S9wuGCGTLX42qD7", level: nil, points: 0, num_catches: 0, num_places: 0, num_sponsors: 0, time_together: 0}
])

Hashtag.create!([
  {name: "Teamfoto", info: "", description: nil, picture: nil, points: 50, repeat_time: nil, level_id: nil, start_date: nil},
  {name: "Freifeld", info: "", description: nil, picture: nil, points: 1, repeat_time: nil, level_id: nil, start_date: nil},
  {name: "Food", info: "", description: nil, picture: "Food.jpg", points: 10, repeat_time: nil, level_id: 1, start_date: nil},
  {name: "Playtime", info: "", description: nil, picture: "Playtime.jpg", points: 10, repeat_time: nil, level_id: 1, start_date: nil},
  {name: "FindHenning", info: "", description: nil, picture: "FindHenning.jpg", points: 3, repeat_time: nil, level_id: 1, start_date: nil},
  {name: "Institutsführung", info: "", description: nil, picture: "Institutsführung.jpg", points: 50, repeat_time: nil, level_id: 2, start_date: nil},
  {name: "Nature", info: "", description: nil, picture: nil, points: 10, repeat_time: nil, level_id: 2, start_date: nil},
  {name: "TagWarGreen", info: "", description: nil, picture: nil, points: 5, repeat_time: nil, level_id: 2, start_date: nil},
  {name: "TagWarBlue", info: "", description: nil, picture: "TagWarBlue.jpg", points: 5, repeat_time: nil, level_id: 2, start_date: nil},
  {name: "Müllaufheben", info: "", description: nil, picture: nil, points: 10, repeat_time: nil, level_id: 2, start_date: nil},
  {name: "Schulung", info: "", description: nil, picture: nil, points: 50, repeat_time: nil, level_id: 3, start_date: nil},
  {name: "Tutorenversorung", info: "Stehe deinen Tutoren mit Speis und Trank zur Seite", description: nil, picture: nil, points: 20, repeat_time: nil, level_id: 3, start_date: nil},
  {name: "Humba", info: "", description: nil, picture: nil, points: 10, repeat_time: nil, level_id: 3, start_date: nil},
  {name: "AusSicherheitsgründen", info: "", description: nil, picture: nil, points: 10, repeat_time: nil, level_id: 3, start_date: nil},
  {name: "ThankTheGameMasters", info: "", description: nil, picture: nil, points: 20, repeat_time: nil, level_id: 3, start_date: nil},
  {name: "CouchCrusher", info: "", description: nil, picture: "CouchCrusher.jpg", points: 10, repeat_time: nil, level_id: 3, start_date: nil},
  {name: "CatchThemAll", info: "", description: nil, picture: nil, points: 10, repeat_time: nil, level_id: 3, start_date: nil},
  {name: "KostümGehtImmer", info: "", description: nil, picture: nil, points: 50, repeat_time: nil, level_id: 3, start_date: nil},
  {name: "Sport", info: "", description: nil, picture: nil, points: 10, repeat_time: nil, level_id: 4, start_date: nil},
  {name: "KuchenFürCharlotte", info: "Charlotte hat Geburtstag. Überrascht sie mit einem Kuchen!", description: nil, picture: "KuchenFürCharlotte.jpg", points: 50, repeat_time: nil, level_id: 4, start_date: nil},
  {name: "Fachschaft", info: "", description: nil, picture: nil, points: 10, repeat_time: nil, level_id: 4, start_date: nil},
  {name: "Wohnheimsbar", info: "", description: nil, picture: nil, points: 10, repeat_time: nil, level_id: 4, start_date: nil},
  {name: "AnmeldungErstiwochenende", info: "", description: nil, picture: nil, points: 30, repeat_time: nil, level_id: 4, start_date: nil},
  {name: "AnmeldungWeihnachtsAG", info: "", description: nil, picture: nil, points: 10, repeat_time: nil, level_id: 4, start_date: nil},
  {name: "UnicUpAuswahlTraining", info: "", description: nil, picture: nil, points: 20, repeat_time: nil, level_id: 4, start_date: nil},
  {name: "FachschaftsSpieleabend", info: "", description: nil, picture: nil, points: 30, repeat_time: nil, level_id: 4, start_date: nil},
  {name: "CatchHenning", info: "Besuche das Fachschaftsmaskottchen im Aachener Tierpark", description: nil, picture: "FindHenning.jpg", points: 50, repeat_time: nil, level_id: 4, start_date: nil}
])

User.create!([
  {group_id: 1, name: "Knut", info: "Toller Hecht", picture: nil, auth_token: "Le2TJZmfq5jigu6A8k5zC39j"},
  {group_id: 1, name: "Ben", info: "Hat zwei grüne Daumen", picture: nil, auth_token: "7AoV1M3zP1rAnZ4MEp48WcPb"},
  {group_id: 1, name: "Tim", info: "Musste es mit dem Info Text völlig übertreiben, so dass dieser drei Zeilen lang sein sollte", picture: nil, auth_token: "WtGH2refK8fPx2LuSVfSfcAF"},
  {group_id: 1, name: "Lisa", info: nil, picture: nil, auth_token: "jUvponZC9t6P29ySsW3RDBCS"},
  {group_id: 1, name: "Lisa", info: nil, picture: nil, auth_token: "VrFcBs64ymij31tmyKXja3vA"},
  {group_id: 1, name: "Eva Maria", info: nil, picture: nil, auth_token: "8wQNEdcs8JRzH3JzGhsqBzQ1"},
  {group_id: 1, name: "Dieter", info: nil, picture: nil, auth_token: "hbEsoyRh8y63nH6Vw9FpYKyp"},
  {group_id: 2, name: "Harald", info: nil, picture: nil, auth_token: "i4XpMWHZCvcNwQ87VfuZX5ZG"},
  {group_id: 2, name: "Peter", info: nil, picture: nil, auth_token: "SAhjDav2RkJGM2tCERvXB8Ee"},
  {group_id: 1, name: "Hansi", info: nil, picture: nil, auth_token: "uQ2ytCN3y3HUGCh6LxQNDPzD"},
  {group_id: 1, name: "Herbert", info: nil, picture: nil, auth_token: "QDgXcgo1JD8AaPfE5Qv3TrZo"},
  {group_id: 1, name: "Andreas Arthur Eugen Albert", info: nil, picture: nil, auth_token: "SuvCaLe3RihWTAp3P63tJfjk"},
  {group_id: 1, name: "Dieter", info: nil, picture: nil, auth_token: "YSdBkVXCYMaJZAwW9DsrTmH6"}
])

RallyeStation.create!([
  {name: "Schwimmnudelziehen"},
  {name: "1, 2 oder 3"},
  {name: "Hüpfburg"},
  {name: "Jenga Schwerelos"},
  {name: "Tic Tac Toe"}
])

RallyeStation.all.each do |station|
  for points in 1..10
    RallyeRating.create! rallye_station: station, points: points
  end
end
