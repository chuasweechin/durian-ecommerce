# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Issue encountered for Heroku deployment
- Do not use cross-env in package.json for production build
- Ensure file pathing works across different machines
- Convert secret key json into ENV