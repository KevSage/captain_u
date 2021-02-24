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
    # Each Tournament has 8 teams
    # Each Team has 20 players 
    Tournament.create(
      name: Faker::Educator.university + "Women's Invitational",
      city: Faker::WorldCup.city,
      state: Faker::Address.state,
      start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) 
    )
end

#Teams
30.times do
    Team.create(
      name: Faker::Team.name,
      age_group: "College",
      coach: Faker::FunnyName.three_word_name  
    )
    20.times do
        random_boolean = [true, false].sample
        Player.create(
            first_name: Faker::Name.female_first_name,
            last_name: Faker::Name.last_name,
            height: Faker::Number.between(from: 60, to: 84),
            weight: Faker::Number.between(from: 120, to: 220),
            birthday: Faker::Date.birthday(min_age: 17, max_age: 24),
            graduation_year: Faker::Number.between(from: 2021, to: 2025),
            position: Faker::Sports::Basketball.position,
            recruit: random_boolean,
            team_id: Team.all.last.id
        )
    end
end


#Assessments
50.times do
    # Create 50 Assessments
end