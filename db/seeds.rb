Group.create!([
  {name: "Einhörner"},
  {name: "Eichhörnchen"},
  {name: "Einhörnchen"},
])
User.create!([
  {group_id: 1, name: "Knut", info: "Toller Hecht"},
  {group_id: 1, name: "Ben", info: "Hat zwei grüne Daumen"},
  {group_id: 1, name: "Tim", info: "Musste es mit dem Info Text völlig übertreiben, so dass dieser drei Zeilen lang sein sollte"},
  {group_id: 1, name: "Lisa"},
  {group_id: 1, name: "Lisa"},
  {group_id: 1, name: "Eva Maria"},
  {group_id: 1, name: "Dieter"},
  {group_id: 2, name: "Harald"},
  {group_id: 2, name: "Peter"},
  {group_id: 1, name: "Hansi"},
  {group_id: 1, name: "Herbert"},
  {group_id: 1, name: "Andreas Arthur Eugen Albert"},
  {group_id: 1, name: "Dieter"},
])
