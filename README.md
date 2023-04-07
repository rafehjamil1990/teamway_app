# README

Step 1: Setup memcached locally
  - install memcached using brew: `brew install memcached`
  - make sure memcached server is running by running following command: `brew services start memcached`
  - set `DALLI_HOST` value to the local server address of memcached (default is already set)

Step 2: Setup Application
  - install ruby version: 3.2.2
  - install dependencies by running `bundle install`
  - run application: `bundle exec rails s`. now application will be accessible on localhost:3000
