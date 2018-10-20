FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt install nodejs

# Rails
RUN mkdir /taskleaf
WORKDIR /taskleaf

COPY Gemfile /taskleaf/Gemfile
COPY Gemfile.lock /taskleaf/Gemfile.lock
RUN bundle install
COPY . /taskleaf
