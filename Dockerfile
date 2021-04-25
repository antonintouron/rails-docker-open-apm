# syntax=docker/dockerfile:1
FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && gem install bundler
RUN gem install rails
RUN apt-get -y install npm
RUN npm install -y yarn --global
WORKDIR /rails-open-apm
COPY ./Gemfile /rails-open-apm/Gemfile
COPY ./Gemfile.lock /rails-open-apm/Gemfile.lock
RUN bundle install
RUN yarn install --force
RUN yarn install --check-files

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
