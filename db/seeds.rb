# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(organization_name: "Food for everyone", email: "charity@gmail.com", password: "password", type: "Charity")
Address.first.update(door_number: "35", street: "Lansdowne Road", city: "London", country: "UK", postcode: "W11 2LQ")

User.create(organization_name: "Sainsbury", email: "sainsbury@gmail.com", password: "password", type: "Provider")
Address.find(2).update(door_number: "114", street: "Campden Hill Road", city: "London", country: "UK", postcode: "W8 7AR")

User.create(organization_name: "Tesco", email: "tesco@gmail.com", password: "password", type: "Provider")
Address.find(3).update(door_number: "127", street: "Ledbury Road", city: "London", country: "UK", postcode: "W11 2AQ")

User.create(organization_name: "Pret a Manger", email: "pretamanger@gmail.com", password: "password", type: "Provider")
Address.find(4).update(door_number: "127", street: "Ledbury Road", city: "London", country: "UK", postcode: "W11 2AQ")

User.create(organization_name: "Waitrose", email: "waitrose@gmail.com", password: "password", type: "Provider")
Address.find(5).update(door_number: "", street: " Westfield London Shopping Centre", city: "London", country: "United Kingdom", postcode: "W12 7GA")

User.create(organization_name: "Asda", email: "asda@gmail.com", password: "password", type: "Provider")
Address.find(6).update(door_number: "2-20", street: "Western Road", city: "London", country: "United Kingdom", postcode: "NW10 7LW")

User.create(organization_name: "Wasabi", email: "wasabi@gmail.com", password: "password", type: "Provider")
Address.find(7).update(door_number: "43", street: "King Street", city: "London", country: "United Kingdom", postcode: "W6 9HW")

User.create(organization_name: "Le Pain Quotidien", email: "lepainquotidien@gmail.com", password: "password", type: "Provider")
Address.find(8).update(door_number: "128", street: "Wilton Road", city: "London", country: "United Kingdom", postcode: "SW1V 1JZ")

User.create(organization_name: "Lidl", email: "lidl@gmail.com", password: "password", type: "Provider")
Address.find(9).update(door_number: "64-70", street: "Camden High Street", city: "London", country: "United Kingdom", postcode: "NW1 0LT")
