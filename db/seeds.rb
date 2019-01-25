# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
TeamPlayer.destroy_all
Team.destroy_all
Player.destroy_all
Match.destroy_all

require_relative 'seedcontrol/csvseed.rb'
Player.create(CsvSeed.csv_to_hash)
