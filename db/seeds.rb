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
    random_tournament = ["Invitational", "Tournament", "Classic", "Jam", "Clash"].sample

    Tournament.create(
      name: Faker::Educator.university + " Women's Basketball " + random_tournament,
      city: Faker::Address.city,
      state: Faker::Address.state,
      start_date: Faker::Date.forward(days: 180) 
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
    2.times do
        random_tourney = Tournament.all.sample
        Entry.create(
            team_id: Team.all.last.id,
            tournament_id: random_tourney.id   
        )
    end
end


#Assessments
1200.times do
    # Create 1200 Assessments
    random_tournament = Tournament.all.sample
    team = random_tournament.teams.sample
    Assessment.create(
        rating: Faker::Number.between(from: 1, to: 10),
        user_id: User.all.sample.id,
        tournament_id: random_tournament.id,
        player_id: team.players.sample.id,
        assessment_type: "event"
    )
end