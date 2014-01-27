# Triptionary

Hello.  Welcome to the wonderful world of Triptionary, the ultimate travel memory app.

[Production Link](http://triptionary.tk)

##Cloning the project

To checkout this project, get the code:

`git clone git@github.com:pzula/travelhub.git`

Go into the triptionary directory:

`cd travelhub`

Install all of the gems:

`bundle`

Make sure PostgreSQL is running on your local machine.  Run 'rake db:setup' and 'rake db:migrate'

Set up the APIs in your local environment (this is multi-step and requires work in the terminal):

To gather the ID and codes for each API, you must visit each site and sign up an app (Twitter, Instagram, Foursquare &amp; Google Maps.)  Once you have done so then you will be provided unique client ids and client secrets.  This will enable the app to be able to give users an access token when they sign in.  

This app uses the Figaro gem to manage these export variables. In the `/config` folder, create an `application.yml` file and within it place the following credentials:

```
---
TWITTER_CONSUMER_KEY: ....
TWITTER_CONSUMER_SECRET: ....
GOOGLE_STATIC_MAP_API_KEY: ....

development:
  INSTAGRAM_CLIENT_ID: ....
  INSTAGRAM_CLIENT_SECRET: ....

  FOURSQUARE_CLIENT_ID: ....
  FOURSQUARE_CLIENT_SECRET: ...


```

and finally... start the server

`rails s`

Go to 'localhost:3000' to checkout the site. 

*Project built on Rails 4.0.0, with a custom-built frontend*

This project was a collaboration between @MappingKat, @RolenTLe, @pzula and @TheRubeAbides - all students of [gSchool1](http://gschool.it) under the instruction of Jeff Casimir &amp; Katrina Owen.

The project requirements can be found here: [Feed Engine](http://tutorials.jumpstartlab.com/projects/feed_engine/feed_engine.html).

