# gets the docker image of ruby 2.5 and lets us build on top of that
FROM ruby:2.6.3-slim

# install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# create a folder /myapp in the docker container and go into that folder
RUN mkdir /backend-live-coding-exercise-ruby-main
WORKDIR /backend-live-coding-exercise-ruby-main

# Copy the Gemfile and Gemfile.lock from app root directory into the /myapp/ folder in the docker container
COPY Gemfile /backend-live-coding-exercise-ruby-main/Gemfile
COPY Gemfile.lock /backend-live-coding-exercise-ruby-main/Gemfile.lock

# Run bundle install to install gems inside the gemfile
RUN bundle install

# Copy the whole app
COPY . /backend-live-coding-exercise-ruby-main
