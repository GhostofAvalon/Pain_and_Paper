# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Room.destroy_all
User.destroy_all

User.create!([{ email: "anan@anan.com", password: "anananan", username: "HennyPop" },
              { email: "rudy@rudy.com", password: "rudyrudy", username: "RudyMars86" },
              { email: "mike@mike.com", password: "mikemike", username: "Mike" },
              { email: "julien@julien.com", password: "julienjulien", username: "GhostOfAvalon" }])

Room.create!([{ name: "HennyRoom", user_id: User.find_by(username: "HennyPop").id },
              { name: "RudyRoom", user_id: User.find_by(username: "RudyMars86").id },
              { name: "MikeRoom", user_id: User.find_by(username: "Mike").id },
              { name: "GhostOfAvalonRoom", user_id: User.find_by(username: "GhostOfAvalon").id }])
