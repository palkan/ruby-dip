# Based on https://gist.github.com/kirs/3912e1a44b67fda906ab4f6aad09ebaf (from https://kirshatrov.com/2020/01/11/contributing-to-mri/)
FROM ruby:2.7.1-buster

ENV DEBIAN_FRONTEND=noninteractive

# tools you need to build MRI
RUN apt-get update && \
    apt-get install -y git autoconf bison gcc make \
    zlib1g-dev libffi-dev libreadline-dev \
    libgdbm-dev libssl-dev build-essential \
    tzdata

# Configure bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler -v "~> 2.0"

# Install benchmark-driver
RUN gem install benchmark-driver
