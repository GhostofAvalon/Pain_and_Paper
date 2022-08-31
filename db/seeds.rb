# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "json"
require "open-uri"

# Destroy every element in current DB
Character.destroy_all
Race.destroy_all
Skill.destroy_all
Background.destroy_all
Job.destroy_all
Equipment.destroy_all
Gift.destroy_all
Spell.destroy_all
Room.destroy_all
User.destroy_all
CharacteristicsList.destroy_all

CharacteristicsList.create!(force_value: 7, dexterity_value: 7,
                            constitution_value: 7, intelligence_value: 7,
                            wisdom_value: 7, charisma_value: 7)

User.create!([{ email: "anan@anan.com", password: "anananan", username: "HennyPop" },
              { email: "rudy@rudy.com", password: "rudyrudy", username: "RudyMars86" },
              { email: "mike@mike.com", password: "mikemike", username: "Mike" },
              { email: "julien@julien.com", password: "julienjulien", username: "GhostOfAvalon" }])

Room.create!([{ name: "HennyRoom", user_id: User.find_by(username: "HennyPop").id },
              { name: "RudyRoom", user_id: User.find_by(username: "RudyMars86").id },
              { name: "MikeRoom", user_id: User.find_by(username: "Mike").id },
              { name: "GhostOfAvalonRoom", user_id: User.find_by(username: "GhostOfAvalon").id }])

# Parsing and Creating 30 Races with Pathfinder API
url = "https://api.pathfinder2.fr/v1/pf2/ancestry"
ancestry_serialized = URI.open(url, "Authorization" => ENV["PATHFINDER_KEY"]).read
ancestry = JSON.parse(ancestry_serialized)

ancestry["results"].first(30).each do |result|
  new_race = Race.new(name: result['name'])
  if result['data']['description']['value'].match(/<em>(.*)<\/em>/)
    new_race.description = result['data']['description']['value'].match(/<em>(.*)<\/em>/)[1]
  elsif result['data']['description']['value'].match(/>(\w{1}.*)</)
    new_race.description = result['data']['description']['value'].match(/>(\w{1}.*)</)[1]
  end

  if new_race.name == "Android"
    new_race.description = "Technological wonders from another world, androids have synthetic bodies and living souls.
                            Their dual nature makes them quick-thinking and calm under pressure, but comfortable in
                            stillness and solitude."
  end
  new_race.save
end


# Parsing and Creating Skills with Pathfinder API
url = "https://api.pathfinder2.fr/v1/pf2/action"
action_serialized = URI.open(url, "Authorization" => ENV["PATHFINDER_KEY"]).read
action = JSON.parse(action_serialized)

action["results"].first(30).each do |result|
  Skill.create!(name: result['name'])
end

# Parsing and Creating 40 Backgrounds with Pathfinder API
url = "https://api.pathfinder2.fr/v1/pf2/background"
background_serialized = URI.open(url, "Authorization" => ENV["PATHFINDER_KEY"]).read
background = JSON.parse(background_serialized)

background["results"].first(30).each do |result|
  specificity = result['data']['description']['value'].split(/<.*?>/).map(&:strip)
                                                      .reject(&:empty?).join(' ').gsub(/\s,/, ',').first(400)
  new_background = Background.new(name: result['name'])
  new_background.specificity = "#{specificity}..."
  new_background.save
end

# Parsing and Creating 40 Jobs with Pathfinder API
url = "https://api.pathfinder2.fr/v1/pf2/class"
job_serialized = URI.open(url, "Authorization" => ENV["PATHFINDER_KEY"]).read
job = JSON.parse(job_serialized)

job["results"].first(30).each do |result|
  description = result['data']['description']['value'].split(/<.*?>/).map(&:strip)
                                                      .reject(&:empty?).join(' ').gsub(/\s,/, ',').first(400)
  new_job = Job.new(name: result['name'])
  new_job.description = "#{description}..."
  new_job.save
end

# Parsing and Creating Equipments with Pathfinder API
url = "https://api.pathfinder2.fr/v1/pf2/equipment"
equipment_serialized = URI.open(url, "Authorization" => ENV["PATHFINDER_KEY"]).read
equipment = JSON.parse(equipment_serialized)

equipment["results"].first(50).each do |result|
  description = result['data']['description']['value'].split(/<.*?>/).map(&:strip)
                                                      .reject(&:empty?).join(' ').gsub(/\s,/, ',').first(400)
  new_equipment = Equipment.new(name: result['name'])
  new_equipment.description = "#{description}..."
  new_equipment.save
end

# Parsing and Creating Gifts with Pathfinder API
url = "https://api.pathfinder2.fr/v1/pf2/feat"
gift_serialized = URI.open(url, "Authorization" => ENV["PATHFINDER_KEY"]).read
gift = JSON.parse(gift_serialized)

gift["results"].first(30).each do |result|
  description = result['data']['description']['value'].split(/<.*?>/).map(&:strip)
                                                      .reject(&:empty?).join(' ').gsub(/\s,/, ',').first(400)
  new_gift = Gift.new(name: result['name'])
  new_gift.description = "#{description}..."
  new_gift.save
end

# Parsing and Creating Spells with Pathfinder API
url = "https://api.pathfinder2.fr/v1/pf2/spell"
spell_serialized = URI.open(url, "Authorization" => ENV["PATHFINDER_KEY"]).read
spell = JSON.parse(spell_serialized)

spell["results"].first(30).each do |result|
  description = result['data']['description']['value'].split(/<.*?>/).map(&:strip)
                                                      .reject(&:empty?).join(' ').gsub(/\s,/, ',').first(400)
  new_spell = Spell.new(name: result['name'])
  new_spell.description = "#{description}..."
  new_spell.save
end

# Creating Characters
Character.create!([{ name: "Grabuj", age: 21, height: 21, level: 21, weight: 21, gender: 'Fluid', user_id: User.find_by(username: "HennyPop").id,
                     race_id: Race.first.id, job_id: Job.first.id, room_id: Room.find_by(name: "HennyRoom").id, characteristics_list_id: CharacteristicsList.first.id, background_id: Background.first.id },
                   { name: "Donotrion", age: 21, height: 21, level: 21, weight: 21, gender: 'Fluid', user_id: User.find_by(username: "RudyMars86").id,
                     race_id: Race.first.id, job_id: Job.first.id, room_id: Room.find_by(name: "RudyRoom").id, characteristics_list_id: CharacteristicsList.first.id, background_id: Background.first.id },
                   { name: "Mikausor", age: 21, height: 21, level: 21, weight: 21, gender: 'Fluid', user_id: User.find_by(username: "Mike").id,
                     race_id: Race.first.id, job_id: Job.first.id, room_id: Room.find_by(name: "MikeRoom").id, characteristics_list_id: CharacteristicsList.first.id, background_id: Background.first.id },
                   { name: "Ghostof", age: 21, height: 21, level: 21, weight: 21, gender: 'Fluid', user_id: User.find_by(username: "GhostOfAvalon").id,
                     race_id: Race.first.id, job_id: Job.first.id, room_id: Room.find_by(name: "GhostOfAvalonRoom").id, characteristics_list_id: CharacteristicsList.first.id, background_id: Background.first.id }])
