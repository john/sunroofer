# https://docs.docker.com/compose/rails/#define-the-project
FROM ruby:2.4.2

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
RUN apt-get update && apt-get install -qq -y build-essential libpq-dev nodejs

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV APP_NAME sunroofer
RUN mkdir -p /$APP_NAME

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR /$APP_NAME

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile Gemfile
# COPY Gemfile.lock Gemfile.lock
RUN bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

# Provide dummy data to Rails so it can pre-compile assets.
# RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["/$APP_NAME/public"]

CMD bundle exec puma -C config/puma.rb

# source: https://nickjanetakis.com/blog/dockerize-a-rails-5-postgres-redis-sidekiq-action-cable-app-with-docker-compose
# FROM ruby:2.4-alpine
#
# RUN apk update && apk add --no-cache build-base nodejs
# # postgresql-dev git
#
# RUN mkdir /app
# WORKDIR /app
#
# COPY Gemfile Gemfile.lock ./
# RUN bundle install --binstubs
#
# # Make port 80 available to the world outside this container
# # EXPOSE 3000
#
# COPY . .
#
# CMD puma -C config/puma.rb