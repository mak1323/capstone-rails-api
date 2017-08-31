# Capstone-Rails-API

This is the backend for my <insert name here> capstone project. This is project,
as stands is the initial steps towards creating a series of tools for your DM
enjoyment.


The following is a link to my ERD:
—Simple:
https://goo.gl/photos/niyfENCWbDUAqh1D6
—Complex:
https://goo.gl/photos/GVUNz2QMHpDd9S6P8

Here are my data models:

I’m modeling my data as follows:
https://goo.gl/photos/yPK5fWNWRYCRbWgv6

Screenshot:
http://i.imgur.com/heCs7P9.png

Deployed:
https://mak1323.github.io/capstone-ember-front-end/

Repo:
https://github.com/mak1323/capstone-ember-front-end

Backend Deployed:
https://lit-taiga-59254.herokuapp.com/

Backend Repo:
https://github.com/mak1323/capstone-rails-api

Well if you want to know more about future releases, look on the following:

## Future Releases Wireframe and User Stories

### Wireframe

The following is my wireframe:
—Simple:
https://goo.gl/photos/AEvq75s1U9XAwJ2Z6
—Complex:
https://goo.gl/photos/5njvQkMKdasv7kePA

### User Stories

The following is a link to my original user stories:
https://goo.gl/photos/UPwfcXgSDpe8vZoU6

The user stories evolved as I streamlined and figuredd out what I wanted most
as a DM and user--organization.

I wanted to keep all my moments of progress and updates in a single place. This
became the following user stories:

##### As a User I want to:

  Create logs that are brief explainations of what I want to tell myself or my
  players about the last game.

  Keep the logs organized by campaign if I am running more than one campaign.

  Be able see the most recent or updated entries first.

  Have full control of deleting and updating any of my logs.

  Destroy all my logs when I destroy a campaign.

### Upcoming release

The next asset to watch out for is the encounter tracker. The encounter is one of the basic units of tabletop gaming, as it is the action, the meat and potatos, the main stay of the gaming world.

The first one to expect will be a quick encounter, without any crud action. This will be used as the prototype of phase two. The quick encounter will allow a user create a que that will he or she will be able to enter in a monster, a character, a player; then organize and cycle through a que keeping track of how much life a unit has and who's turn it is. Definitely useful for games like Pathfinde, Dungeons and Dragons, Magic the Gathering, or even Smurfs-the Satanic Table Top Rpg For the Apocalypse.

Once this is completed, the next step is allowing a user to track monsters and player characters and upload them to a saved encounter simliar to the how logs work.

## My Approach

I am constantly inspired to create projects that I want to use. I read once that developers should always build for themselves, and I took that to heart. So with that, I planned one massive, complicated project that I knew I could pull off using a traditional borwser template spa. Well, since I was determined to Ember, I had to cut it down.

What I came down to was to create organization first, before the fun stuff. This means I wanted to create my logs and use that for my prototype of the next steps.

So I started with my wireframing and my ORD, which pointed to a one to many one to many relationship. I approached the backend first, modeled my data, and got to work creating my campaigns. After that I created a rough wireframe site (http://i.imgur.com/KFBFVAH.png). I changed my css to have a global shader so i could see where everything lay, a nifty trick.

After that I got to work, generating my routes, mmodifying as needed, and inserting. As soon as I got my full CRUD on campaigns, I got to work on the campaign logs.

Those proved far more difficult, as the index and create functions were nested into the campaigns routes, and that proved a huge hurtle. After putting in an adapter, I got things working. After that, it became a matter of smoothing things out and sanding it down.

I think of web development as building a table. You have to build the api, or the legs if you will that it stands upon. Then you connect those to your table top, your front end. From there, you sand it, prime it, stain it, paint it, and generally mke it look nice. When all else fails, add a table cloth.

## Technologies Used

This project is made with Ember on the front end Rails on the back end. The Ember component is built using the GA-Ember-Auth-Template, which is a fantastic package that streamlined the process.

Rails working ith a tradition sql database is the best way to go for this data as it is enssentially ralational with one to many one to many. Plus the rails api allows for greater control, with the generation of scaffolding nad the customization of routes.

I used sql and sql codes to seed my tables instead of seeding through rails as I always feel I have more control and better ability to see what is wrong with data in real time. The included scripts for my seeding are in the scripts folder in this repo.

However...

## Major Hurtles

Rails is a system that I am comfortable with. This being said, I tried something new with a nested resource under a protected controller. This lead to all my index and create functions being filtered through another resource. This made my curl requests for the two a little off. THe following is my curl script for those:

GET:
```
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/campaigns/${ID}/campaign_logs"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
```

Create
```
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/campaigns/${ID}/campaign_logs"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "campaign_log": {
      "title": "'"${TITLE}"'",
      "log": "'"${LOG}"'"
    }
  }'

echo
```

The create curl runs into errors still. The campaign aspect that campaign logs filters through, however are surprisingly straight forward.

create-campaign
```
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/campaigns"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "campaign": {
      "user_id": "'"${ID}"'",
      "name": "'"${NAME}"'",
      "completed": "'"${BOOL}"'"
    }
  }'

echo

```

get-campaigns
```
#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/campaigns"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

```
When using this app, pay close attention to the controller and routes for campaign_logs, as you will need to validate the user and the campaign for some aspects and not others.
## Original Pitch

My original pitch was created on Github through an issue.
The link is:
https://github.com/ga-wdi-boston/capstone-project/issues/792

The content is as follows:
"This is my 1:1 request

My project idea is a Dungeons and Dragons (3.5) encounter tracker.

The inspiration for this project is that this is something that I actually want, I would definitely use, and it solves a problem that occurs when I’m DMing: “Who’s turn is it again?”

The following is a link to my user stories:
https://goo.gl/photos/UPwfcXgSDpe8vZoU6

The target audience and user is a Dungeon Master or Game Master.

The following is a link to my ERD:
—Simple:
https://goo.gl/photos/niyfENCWbDUAqh1D6
—Complex:
https://goo.gl/photos/GVUNz2QMHpDd9S6P8

The following is my wireframe:
—Simple:
https://goo.gl/photos/AEvq75s1U9XAwJ2Z6
—Complex:
https://goo.gl/photos/5njvQkMKdasv7kePA

I’m modeling my data as follows:
https://goo.gl/photos/yPK5fWNWRYCRbWgv6

I have yet to model my encounter data but I’m thinking it will look like:

|id|user_id|campaign_id|encounter_data|

encounter_data
```
[
	{
	type: (char or monster),
	id: (char_id or monster_id),
	activeHp: num,
	initiative: num,
	isActive: bool,
	currentTurn: bool,
	},
	{
	type: (char or monster),
	id: (char_id or monster_id),
	activeHp: num,
	initiative: num,
	isActive: bool,
	currentTurn: bool,
	},
	{
	type: (char or monster),
	id: (char_id or monster_id),
	activeHp: num,
	initiative: num,
	isActive: bool,
	currentTurn: bool,
	}
]
```
The idea here is to create a nested schema expecting an array. This way I don’t straight modify the characters here in the game. I do however create new stats that are only prevalent to the scope of the current encounter.

I use this to allow myself to load characters and monsters generated by the user, allowing for full customization and full access of crud.

I know how to approach this project using Browser Template, but I’m not sure about ember. I designed my wireframe with ember in mind, but I’m entirely sure how to approach some of the js functions using ember.

My current plan of attack is to create two or three repos. First I want to get my backend working and test that using my browser template crud action ability. Once I know all my backend and crud is working, I either want to make a new front end using ember or using browser template."




### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```

### Reset Database without dropping

This is not a task developers should run often, but it is sometimes necessary.

**locally**

```sh
bin/rake db:migrate VERSION=0
bin/rake db:migrate db:seed db:examples
```

**heroku**

```sh
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate db:seed db:examples
```

## Conclusion

This project was both a challenge and a joy. I learned more in this project than I had in any other, but at the same time I felt more methodical in approaching this project than any other. To say that this course wasn't a challenge is a lie, as I am not a methodical thinker to the point of a programmer. Working bars, class rooms, and such has gotten me more to be a methodical big picture thinker. Here, I finally feel like a web developer.

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
# capstone-rails-api
