## fairMuse

A SPA Music streaming service that aims to distribute revenue fairly among artists. fairMuse tracks the stream count of each listener and divides their monthly subscription proportionately amongst the artists they listen to, based on the amount of streams their tracks have had from the user.

This was created over two weeks as a final project for @Makers Academy (Ronin) 
by Yan-Yi Li, Marco Bagnasco, Mark Hill, Russell Vaughan and David Parry. 

## Overview of technologies used:

-The frontend is built with AngularJS with the backend built with Rails (configured as an API)

-Angular player was used and configured for music playback

-All music is uploaded to and streamed directly from an Amazon S3 bucket. For file uploading 'ng-file-upload' was used on the frontend with Paperclip on the backend.

-For subscriptions and user payments, Stripe's Checkout service has been integrated into the backend.

-For user authentication, Devise was used on the backend. Successful user logins provide a token that Angular stores in a users local storage.

## Approach to development:

The team used an agile development process and began with a product design sprint. After research a MVP was decided upon and storyboarded. Daily standups and pair programming were integral to development. All code was test driven including unit tests (Karma on the frontend, RSPEC on the backend) and full integration tests.  

## Screenshots

![Image of Photos Page]
http://i.imgur.com/p1HajgA.png

## Live Site

tbc

###Instructions

To deploy frontend

```
$ git clone https://github.com/MarcoCode/fairMuse.git
$ cd fairMuse/front-end
$ bower install # Installs all frontend dependencies
$ grunt serve
```

In seperate terminal window:

To deploy backend

```
$ cd back-end
$ bundle # Installs all backend dependencies
$ rails server # Runs the application locally
```

## Testing

Frontend tests: ```grunt test``` #will run the unit tests with karma.
Backend & Integration tests: ```rspec```

# Docs 

User stories in docs/user_stories.md
