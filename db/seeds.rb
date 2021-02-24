# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Users
kevin = User.create(email: "kevinsage@stacksports.com", password: "testing")
sage = User.create(email: "sagekevin@stacksports.com", password: "testtest")

#Tournaments

10.times do
    Tournament.create(
      name: Faker::Educator.university + " Invitational",
      city: Faker::WorldCup.city,
      state: Faker::Address.state,
      start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) 
    )
end