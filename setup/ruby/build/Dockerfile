ARG VERSION
FROM ruby:${VERSION}

RUN mkdir -p /dojo/problem
ADD Gemfile /dojo/Gemfile
ADD Guardfile /dojo/Guardfile

WORKDIR /dojo/problem

RUN gem install bundler
RUN bundle --gemfile /dojo/Gemfile
