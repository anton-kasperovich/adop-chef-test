FROM ruby:2.3.1-alpine

MAINTAINER Anton Kasperovich <anton.kaspiarovich@accenture.com>

# Install system packages
RUN apk add --update \
            sudo \
            bash \
            docker \
            build-base \
            libxml2-dev \
            libxslt-dev \
            zlib-dev && \
            rm -rf /var/cache/apk/*

# Install NokoGiri gem separately, with system libraries usage
RUN gem install --no-ri --no-rdoc nokogiri -- --use-system-libraries

# Install gem dependencies
RUN gem install --no-ri --no-rdoc \
    foodcritic \
    berkshelf \
    chefspec \
    test-kitchen \
    kitchen-docker \
    rsync
