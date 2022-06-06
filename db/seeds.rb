# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Car.create(name: "Toyota", reserved: false, description: "This is a toyota", user_id: 1)
Car.create(name: "Honda", reserved: false, description: "This is a honda", user_id: 2)
Car.create(name: "Ford", reserved: false, description: "This is a ford", user_id: 3)