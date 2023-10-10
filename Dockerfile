# Base image
FROM ruby:3.0.6

MAINTAINER rakvium@gmail.com

RUN apt-get update && apt-get -y install \
  curl \
  libxml2-dev libxslt1-dev \
  imagemagick \
  nano \
  rsync \
  wget \
  nodejs \
  postgresql \
  postgresql-contrib

RUN gem install bundler

ENV APP_HOME /app
RUN mkdir -p /$APP_HOME
WORKDIR /$APP_HOME

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]

RUN rake db:create db:migrate
