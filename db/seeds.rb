
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_parks
  end

  def generate_parks
    20.times do |i|
      park = Park.create!(
        name: Faker::Book.author,
        location: Faker::Address.state
      )
      puts "Park #{i}: Name is #{park.name} and location is '#{park.location}'."
    end
  end
end

Seed.begin
