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

# Install common Jekyll plugins
RUN gem install \
  jekyll-avatar \
  jekyll-coffeescript \
  jekyll-default-layout \
  jekyll-email-protect \
  jekyll-feed \
  jekyll-gist \
  jekyll-github-metadata \
  jekyll-mentions \
  jekyll-optional-front-matter \
  jekyll-paginate-v2 \
  jekyll-readme-index \
  jekyll-redirect-from \
  jekyll-relative-links \
  jekyll-sass-converter:2.2 \
  jekyll-seo-tag \
  jekyll-sitemap \
  jekyll-titles-from-headings \
  jekyll-toc \
  jemoji \
  faraday-retry:2.4 \
  sass-embedded:1.78.0 \
  ;

EXPOSE 4000

CMD ["sh", "-c", "bundle install && bundle exec jekyll build"]
