FROM ruby:2.3.1-alpine

# Install system packages
RUN apk add --update \
        bash \
		build-base \
        libxml2-dev \
        libxslt-dev \
        zlib-dev && \
		rm -rf /var/cache/apk/*

# Install NokoGiri separatelly with system libraries usage
RUN gem install nokogiri -- --use-system-libraries

# Install gem dependencies
RUN gem install foodcritic \
    berkshelf \
    chefspec \
    rsync
