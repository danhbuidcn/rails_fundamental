FROM ruby:3.1.4
RUN apt-get update

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs npm

RUN apt-get install -y libssl-dev libreadline-dev zlib1g-dev \
    autoconf bison build-essential libyaml-dev \
    libncurses5-dev libffi-dev libgdbm-dev \
    && npm install -g yarn \
    && mkdir /myapp

#used in batch job.
RUN apt-get install -y cron

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY . /myapp
RUN yarn install
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-e", "${RAILS_ENV}"]
