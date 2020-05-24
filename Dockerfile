FROM ruby:2.6.5-slim
LABEL maintainer "Martin Cavoj <martincavoj@gmail.com>"

ENV LANG C
ENV LC_ALL C.UTF-8

RUN apt-get update -qqy && apt-get -qqyy install curl wget
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list \
  && wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -
RUN apt-get update -qqy && apt-get -qqyy install nodejs yarn heroku-toolbelt \
  && rm -rf /var/lib/apt/lists/*
RUN gem install bundler:2.1.4
RUN gem install dpl
