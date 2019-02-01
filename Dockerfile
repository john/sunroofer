# pushing to heroku container registry per:
# https://devcenter.heroku.com/articles/container-registry-and-runtime#getting-started

# heroku container:login
# heroku container:push web
# heroku container:release web

FROM ruby:2.6.0-alpine3.8

RUN apk update
RUN apk add \
  bash \
  build-base \
  git \
  nodejs \
  python3 \
  postgresql-dev \
  postgresql-client \
  tzdata \
  yarn \
  && rm -rf /var/cache/apk/*

# First copy the bundle files and install gems to aid caching of this layer
WORKDIR /tmp
COPY Gemfile* /tmp/
RUN bundle install

ENV app /app
RUN mkdir $app
WORKDIR $app
ADD . $app

EXPOSE 3000