## fairMuse

A SPA Music streaming service that aims to distribute revenue fairly among artists. FairMuse tracks the stream count of each listener and divides their monthly subscription proportionately amongst the artists they've listened to that month.

This was created over two weeks as a final project for @Makers Academy (Ronin)
by Yan-Yi Li, Marco Bagnasco, Mark Hill, Russell Vaughan and David Parry.

## Overview of technologies used:

-AngularJS frontend (SPA) with Rails API on the backend.

-Angular Player for music playback

-Amazon S3 for music storage. 'ng-file-upload' for Angular file uploads along with Paperclip on the backend.

-Stripe's Checkout service for subscriptions and user payments.

-Devise for user authentication. Successful user logins provide a token that Angular stores in a user's local storage.

## Approach to development:

The team used an agile development process that began with a product design sprint. After research an MVP was decided upon and storyboarded. Daily standups and pair programming were integral to the process. All code was test driven, including unit tests (Karma on the frontend, RSPEC on the backend) with full integration tests.

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
