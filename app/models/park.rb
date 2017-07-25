class Park < ApplicationRecord
  validates_presence_of :name, :location

  scope :search, -> (keyword){ where("name like ?", "%#{keyword}%") }
  scope :random_park, -> (number){(
  select("parks.name")
  .order("random()")
  .limit("#{number}")
  )}
end
