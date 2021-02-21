FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

WORKDIR /desafio-ruby-backend

COPY Gemfile /desafio-ruby-backend/Gemfile
COPY Gemfile.lock /desafio-ruby-backend/Gemfile.lock

RUN cd /desafio-ruby-backend && bundle install
ADD . /desafio-ruby-backend
EXPOSE 3000