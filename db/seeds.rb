# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Kyle", email: "kyle@email.com", password: 'password')

Brewery.create(name: 'Cool Brewery', phone: '09090', website_url: 'url@url', brewery_type: "micro", location_id: 1)

Location.create(country: "USA", state: "NY", city: "NYC", address: 'address 207', street: '88', longitude: '354', latitude: '9809')