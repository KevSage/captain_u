# README

This is an API that was spun up at the request of the great individuals at Stack Sports. The API contains endpoints to various tournament related sports stats such as tournament info, teams, players and assessments.

### Install Dependencies

    bundle install

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Start the server

    rails s

### Login

You can create a new user by submitting a POST request to http://localhost:3000/api/v1/users and providing an email and password.

You can also use a sample account I've created by submitting a POST request to http://localhost:3000/api/v1/login and providing the following.

```
{
	"user" : {
		"email": "kevinsage@stacksports.com",
		"password": "testing"
	}
}
```
