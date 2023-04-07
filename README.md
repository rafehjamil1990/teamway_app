# README

Step 1: Setup memcached locally
  - install memcached using brew: `brew install memcached`
  - make sure memcached server is running by running following command: `brew services start memcached`
  - set `DALLI_HOST` value to the local server address of memcached (default is already set)

Step 2: Setup Application
  - install ruby version: 3.2.2
  - install dependencies by running `bundle install`
  - run application: `bundle exec rails s`. now application will be accessible on localhost:3000


NOTE: config/questions.yml file shouldn't be empty

Purpose of this application is to determine whether the personality of the test taker is INTROVERT or EXTROVERT through a series of questions.
With default questions INTROVERT score threshold is set to 20. You can edit that threshold if you add custom set of questions in Answer class.