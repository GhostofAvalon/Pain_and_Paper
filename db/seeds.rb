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
Race.destroy_all
Skill.destroy_all
Background.destroy_all
Job.destroy_all
Equipment.destroy_all
Gift.destroy_all

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
  new_race.save
end


# Parsing and Creating Skills with Pathfinder API
url = "https://api.pathfinder2.fr/v1/pf2/action"
action_serialized = URI.open(url, "Authorization" => ENV["PATHFINDER_KEY"]).read
action = JSON.parse(action_serialized)

action["results"].each do |result|
  Skill.create!(name: result['name'])
end

# Parsing and Creating 40 Backgrounds with Pathfinder API
url = "https://api.pathfinder2.fr/v1/pf2/background"
background_serialized = URI.open(url, "Authorization" => ENV["PATHFINDER_KEY"]).read
background = JSON.parse(background_serialized)

background["results"].first(40).each do |result|
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

job["results"].first(40).each do |result|
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

equipment["results"].each do |result|
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

gift["results"].each do |result|
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

spell["results"].each do |result|
  description = result['data']['description']['value'].split(/<.*?>/).map(&:strip)
                                                      .reject(&:empty?).join(' ').gsub(/\s,/, ',').first(400)
  new_spell = Spell.new(name: result['name'])
  new_spell.description = "#{description}..."
  new_spell.save
end
