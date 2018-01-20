FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /flat_plat_API_app
WORKDIR /flat_plat_API_app
COPY Gemfile /flat_plat_API_app/Gemfile
COPY Gemfile.lock /flat_plat_API_app/Gemfile.lock
RUN bundle install
COPY . /flat_plat_API_app
