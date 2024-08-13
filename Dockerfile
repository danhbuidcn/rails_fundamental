FROM ruby:3.1.4

# Install Node.js and Yarn
RUN apt-get update -qq \
    && apt-get install -y \
       nodejs \
       yarn \
       build-essential \
       libpq-dev \
       cron

# Install necessary libraries
RUN apt-get install -y \
       libssl-dev \
       libreadline-dev \
       zlib1g-dev \
       autoconf \
       bison \
       build-essential \
       libyaml-dev \
       libncurses5-dev \
       libffi-dev \
       libgdbm-dev

# Create application directory
RUN mkdir /myapp
WORKDIR /myapp

# Copy Gemfile and Gemfile.lock and install gems
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Copy application code into the container
COPY . /myapp

# Copy and set permissions for the entrypoint file
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Set entrypoint and startup commands
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
