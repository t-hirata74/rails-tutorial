FROM ruby:2.6.5
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /rails-tutorial
WORKDIR /rails-tutorial
COPY Gemfile /rails-tutorial/Gemfile
COPY Gemfile.lock /rails-tutorial/Gemfile.lock
RUN gem install bundler
RUN bundle install
RUN yarn install --check-files &&  yarn add jquery@3.4.1 bootstrap@3.4.1 && apt-get -y install imagemagick

COPY . /rails-tutorial
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"] 