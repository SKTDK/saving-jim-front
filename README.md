[![Build Status](https://travis-ci.com/SKTDK/saving-jim-front.svg?branch=master)](https://travis-ci.com/SKTDK/saving-jim-front)

# saving-jim-front

## How to use

### 1. Account creation

First you need to create a new user or use an existing one.
The default one is : username: xd password: xd
To create a user you can use Postman.

1. Run the latest back-end server
2. Open postman and make a POST to: localhost:8080/register
3. Set the header content-type to application/json
4. Set the body to a JSON document
   Example:
   {
   "username": "test",
   "password": "test"
   }
5. Send your request. it should return the object \_id

### 2. Running the app

You need to fill in the credentials. Since there is no privilege system yet you will be directly considered as an Admin
