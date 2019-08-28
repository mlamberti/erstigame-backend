Group.create!([
  {name: "Einhörner"},
  {name: "Eichhörnchen"},
  {name: "Einhörnchen"}
])
Hashtag.create!([
  {name: "findHenning", info: "Besuche das Fachschaftsmaskottchen im Aachener Tierpark", description: nil, picture: nil, points: 100, repeat_time: nil},
  {name: "tutorversorgung", info: "Stehe deinen Tutoren mit Speis und Trank zur Seite", description: nil, picture: nil, points: 20, repeat_time: nil},
  {name: "kuchenFürCharlotte", info: "Charlotte hat Geburtstag. Überrascht sie mit einem Kuchen!", description: nil, picture: nil, points: 200, repeat_time: "2000-01-01 00:00:00"}
])
User.create!([
  {group_id: 1, name: "Knut", info: "Toller Hecht", picture: nil},
  {group_id: 1, name: "Ben", info: "Hat zwei grüne Daumen", picture: nil},
  {group_id: 1, name: "Tim", info: "Musste es mit dem Info Text völlig übertreiben, so dass dieser drei Zeilen lang sein sollte", picture: nil},
  {group_id: 1, name: "Lisa", info: nil, picture: nil},
  {group_id: 1, name: "Lisa", info: nil, picture: nil},
  {group_id: 1, name: "Eva Maria", info: nil, picture: nil},
  {group_id: 1, name: "Dieter", info: nil, picture: nil},
  {group_id: 2, name: "Harald", info: nil, picture: nil},
  {group_id: 2, name: "Peter", info: nil, picture: nil},
  {group_id: 1, name: "Hansi", info: nil, picture: nil},
  {group_id: 1, name: "Herbert", info: nil, picture: nil},
  {group_id: 1, name: "Andreas Arthur Eugen Albert", info: nil, picture: nil},
  {group_id: 1, name: "Dieter", info: nil, picture: nil}
])
