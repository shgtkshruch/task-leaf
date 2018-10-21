FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt install nodejs

# Chrome
RUN apt-get install -y libappindicator1 fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libgtk-3-0 libnspr4 libnss3 libx11-xcb1 libxss1 libxtst6 xdg-utils
RUN export CHROME_BIN=/usr/bin/google-chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb

# Rails
RUN mkdir /taskleaf
WORKDIR /taskleaf

COPY Gemfile /taskleaf/Gemfile
COPY Gemfile.lock /taskleaf/Gemfile.lock
RUN bundle install
COPY . /taskleaf
