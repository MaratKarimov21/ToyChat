# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_1 = User.create!(username: 'Mark21', password: '123456')
user_2 = User.create!(username: 'Dan23', password: '123456')
user_3 = User.create!(username: 'Max24', password: '123456')

user_1.friends << user_2

user_2.send_invitation_to(user_3)
