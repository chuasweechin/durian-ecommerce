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

# Fixed done for Heroku deployment
- Convert secret key into ENV
- Always use lower case for require gem in .rb files
- modify config/environments/production.rb with config.assets.js_compressor = Uglifier.new(harmony: true)