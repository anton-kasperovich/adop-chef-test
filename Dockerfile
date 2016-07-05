FROM ruby:2.3.1-alpine

MAINTAINER Anton Kasperovich <anton.kaspiarovich@accenture.com>

# Install system packages
RUN apk add --update \
            jq \
            sudo \
            bash \
            docker \
            build-base \
            libxml2-dev \
            libxslt-dev \
            zlib-dev && \
            rm -rf /var/cache/apk/*

# Install NokoGiri gem separately, with system libraries usage
RUN gem install --no-ri --no-rdoc nokogiri:1.6.7.2 -- --use-system-libraries

# Install gem dependencies
RUN gem install --no-ri --no-rdoc \
    cookstyle:0.0.1 \
    foodcritic:6.3.0 \
    berkshelf:4.3.3 \
    chefspec:4.7.0 \
    test-kitchen:1.9.1 \
    kitchen-docker:2.4.0 \
    rsync:1.0.9
