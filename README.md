#Hair Salon App

### Description:
This app allows a user to add both stylists and patrons individually.

The user can update the information for both individually.

Clients can be assigned to a single stylist, this relationship can be updated on the stylist page.

### Usage:

Clone this repo:

`git clone http://github.com/patsul12/hair_salon.git`

run `bundle install`

You will need to set up the postgres database in order for the app to have functionality.

Make sure there is a running instance of postgres
`CREATE DATABASE hair_salon;`

`CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);`

`CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id integer);`

if you want to run tests create a test database:

`CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;`

start upp the server by running `ruby app.rb` from the prohect root.

###Author: Patrick Sullivan

###License: MIT
