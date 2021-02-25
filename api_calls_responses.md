# Captain U API Challenge

---

## First Things First!

### Create a User

#### If you choose to create a new user login, first you'll need to send a POST request to the following endpoint with your chosen email address an a password.

http://localhost:3000/api/v1/users

```
{
	"user" : {
		"email": "kevinsage@stacksports.com",
		"password": "testing"
	}
}
```

#### In return you should receive your user information with the JWT token in json format.

<br>

### Login

#### To view any data within the API you'll need to login after creating your user. To do this we'll send a post request to the following endpoint.

http://localhost:3000/api/v1/login

#### Your request will need to be sent in json format

```
{
  "user":
    {
		"email": "kevinsage@stacksports.com",
		"password": "testing"
	}
}
```

#### Following successful login you should receive a response in json format containing the created user information along with a JWT authorization token.

```
{
    "user": {
        "id": 1,
        "email": "kevinsage@stacksports.com"
    },
    "jwt": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.JC6qKuH9SG0SIiYSfhZUFTtirxN9Q47buLk0DPFFFzE"
}
```

You'll need to copy the JWT authorization token and include it in your authorization header before you can access any data from the api.

<br>

### Profile Access/Auto Login

#### The following endpoint will take you to your profile. If using Postman, make sure that you include the JWT token provided from your login response. You will, in turn, receive a response with your user information, in json format.

http://localhost:3000/api/v1/profile

```
"user": {
        "id": 1,
        "email": "kevinsage@stacksports.com"
    }
```

## Endpoints

#

### Tournaments

#### A get request to the _tournaments_ endpoint will give a full list of all tournaments.

http://localhost:3000/api/v1/tournaments

```
{
        "id": 1,
        "name": "Mallowtown University Women's Basketball Jam",
        "city": "Mikichester",
        "state": "Vermont",
        "start_date": "2021-08-16"
    }
```

#### From the tournaments endpoint, we can drill down several levels to find more information about the teams participating in the tournaments, their players, as well as assessments.<br/><br/>

#### The following endpoint provides information about the tournament with the corresponding id, in this case 1 represents the tournament with the id of '1'.

http://localhost:3000/api/v1/tournaments/1

```
{
    "id": 1,
    "name": "Mallowtown University Women's Basketball Jam",
    "city": "Mikichester",
    "state": "Vermont",
    "start_date": "2021-08-16"
}
```

#### We can drill down a bit further to find information about all teams participating in the tournament.

http://localhost:3000/api/v1/tournaments/1/teams

```
{
        "id": 4,
        "name": "Mississippi ducks",
        "age_group": "College",
        "coach": "Father A. Long"
    },
    {
        "id": 5,
        "name": "Wyoming vixens",
        "age_group": "College",
        "coach": "I. M. Boring"
    }
```

#### From there we can go a level deeper to find information on a specific team.

http://localhost:3000/api/v1/tournaments/1/teams/4

```
{
        "id": 4,
        "name": "Mississippi ducks",
        "age_group": "College",
        "coach": "Father A. Long"
    }
```

#### By appending players to the previous endpoint we have access to a list of all players on a team.

http://localhost:3000/api/v1/tournaments/1/teams/4/players

```
{
        "id": 61,
        "first_name": "Misty",
        "last_name": "Rodriguez",
        "height": 60,
        "weight": 217,
        "birthday": "2000-12-27",
        "graduation_year": 2021,
        "position": "Power Forward",
        "recruit": false
    },
    {
        "id": 62,
        "first_name": "Dora",
        "last_name": "Sauer",
        "height": 61,
        "weight": 214,
        "birthday": "1999-12-07",
        "graduation_year": 2024,
        "position": "Shooting Guard",
        "recruit": false
    }
```

#### By appending the players id to the endpoint, you'll find information on one specific player.

http://localhost:3000/api/v1/tournaments/1/teams/4/players/61

```
{
        "id": 61,
        "first_name": "Misty",
        "last_name": "Rodriguez",
        "height": 60,
        "weight": 217,
        "birthday": "2000-12-27",
        "graduation_year": 2021,
        "position": "Power Forward",
        "recruit": false
    }
```

#### The final level of the tournaments endpoint will provide a list of assessments for the player.

http://localhost:3000/api/v1/tournaments/1/teams/4/players/61/assessments

```
{
        "id": 586,
        "rating": 5,
        "player": {
            "id": 61,
            "first_name": "Misty",
            "last_name": "Rodriguez",
            "height": 60,
            "weight": 217,
            "birthday": "2000-12-27",
            "graduation_year": 2021,
            "position": "Power Forward",
            "recruit": false,
            "team_id": 4,
            "created_at": "2021-02-24T23:16:00.576Z",
            "updated_at": "2021-02-24T23:16:00.576Z"
        }
    }
```

#### A user also has the ability to create a new assessment by providing the user's id, tournament id, player id, and the assessment type.

<br>

#### To do this, simply make a POST request to the following endpoint.

http://localhost:3000/api/v1/assessments
<br>

#### Be sure to provide your assessment information in json format, like so.

```
{
	"rating": 9,
        "user_id": 1,
        "tournament_id": 4,
        "player_id": 1,
        "assessment_type": "event"
}
```

#### The following endpoints will provide an extensive list of all tournaments, teams, players, and assessments.

#### http://localhost:3000/api/v1/tournaments

#### http://localhost:3000/api/v1/teams

#### http://localhost:3000/api/v1/players

#### http://localhost:3000/api/v1/assessments

<br>

## Technical Questions

1. How long did you spend on the code challenge?  
   What would you add to your solution if you had more time?

   _I can't really keep track of time while coding but the completion of this API and the additional documentation took approxiamately 10-12 hours of work._

   _If given more time to complete the assignment, I would have loved to an additional Notes model to accompany the Assessments Model_
   <br>

2. What was the most useful feature that was added to the latest version of a language you used? Please include a snippet of code that shows how you've used it.

   _I've been recently using webpacker to integrate my React in my rails applications. This has simplified integration substantially._

   `bin/rails webpacker:install:react `

3. How would you track down a performance issue in production? Have you ever had to do this?

   _I haven't had a lot of practical experience tracking down performance issues in production, however, the troubleshooting I have done usually involves checking browser/network stability and database functionality_

4. Please describe yourself using JSON

   ```
   {
     "firstName": "Kevin",
     "lastName": "Sage",
     "age": 36,
     "hometown": "Tampa, FL",
     "city": "Atlanta",
     "relationshipStatus: "Married",
     "children": true,
     "hobbies":
     [
         "Jazz", "Traveling", "Reading", "Tampa Bay Sports"
     ],
     "adjectives":
     [
         "driven", "dilligent", "hard-working", "humble", "easy-going", "relatable"
     ]
   }
   ```
