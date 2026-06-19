ARG RUBY_VERSION=3.4.9
FROM ruby:${RUBY_VERSION}

# Re-declare after FROM so it's available in the build context
ARG RUBY_VERSION=3.4.9
ARG JEKYLL_VERSION=4.4.1

RUN apt-get update \
  && apt-get install -y \
    build-essential \
    nodejs \
    npm \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  ;

WORKDIR /srv/jekyll

# Install Bundler and pinned Jekyll version
RUN gem install bundler jekyll:${JEKYLL_VERSION}

EXPOSE 4000

CMD ["sh", "-c", "bundle install && bundle exec jekyll build"]
