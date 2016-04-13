FROM java:8

MAINTAINER Fabrizio Di Napoli <fabrizio.dinapoli@scmspain.com>

ENV SBT_VERSION 0.13.9
ENV NODEJS_VERSION 4.x

# Download sbt deb
RUN \
  curl -L --insecure -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update

# Download nodejs deb
RUN curl -sL https://deb.nodesource.com/setup_$NODEJS_VERSION | bash -

# install packages
RUN apt-get install -y ruby-full sbt nodejs

# Install npm
RUN curl -sL --insecure install.sh http://npmjs.org/install.sh | bash -

# Install sass
RUN gem install sass