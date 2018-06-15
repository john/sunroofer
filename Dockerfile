# docker build -t sunroofer .
# docker run sunroofer
# docker-compose up --build

FROM ruby:2.4

# # Install dependencies:
# # - build-essential: To ensure certain gems can be compiled
# # - nodejs: Compile assets
# # - libpq-dev: Communicate with postgres through the postgres gem
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs

ENV APP_NAME sunroofer

RUN mkdir -p /$APP_NAME
# RUN mkdir -p /sunroofer

# # This sets the context of where commands will be ran in and is documented
# # on Docker's website extensively.
# WORKDIR /$APP_NAME
WORKDIR /$APP_NAME

COPY Gemfile ./
COPY Gemfile.lock ./

RUN gem install bundler && bundle install

# # Copy code from current directory to the working container directory (WORKDIR)
COPY . ./

# # Provide dummy data to Rails so it can pre-compile assets.
# # RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

# # Expose a volume so that nginx will be able to read in assets in production.
# VOLUME ["/$APP_NAME/public"]

EXPOSE 3000

# Configure an entry point, so we don't need to specify 
# "bundle exec" for each of our commands.
ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "server", "-b", "0.0.0.0"]
