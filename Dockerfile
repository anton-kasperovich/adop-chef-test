FROM ruby:2.3

MAINTAINER Mark Rendell, <mark.rendell@accenture.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    dos2unix jq

RUN gem install foodcritic
