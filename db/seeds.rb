# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

Funko.destroy_all
User.destroy_all


file = File.read("./db/db.json")

data_hash = JSON.parse(file)

Funko.create(data_hash)

User.create([{
  password: "7732", username: "marcomiranda", email: "marmirand@hotmail.com", city: "London", country: "UK", pic_url: "https://uploads-learn.s3.amazonaws.com/uploads/identities/learn_account/avatar/7fda07c0-2caa-45b3-8eb3-19fe49f1d359/avatar.jpeg"
}])