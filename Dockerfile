FROM ruby:2.2
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev openssl libssl-dev libyaml-dev libreadline-dev libxml2-dev libxslt1-dev
WORKDIR /opt/myapp
ENV RAILS_ENV production

# Add Gemfile stuff first as a build optimization
# This way the `bundle install` is only run when either Gemfile or Gemfile.lock is changed
# This is because `bundle install` can take a long time
# Without this optimization `bundle install` would run if _any_ file is changed within the project, no bueno
ADD Gemfile /opt/myapp/
ADD Gemfile.lock /opt/myapp/
RUN bundle install

# This will now install anything in Gemfile.tip
# This way you can add new gems without rebuilding _everything_ to add 1 gem
# Anything that was already installed from the main Gemfile will be re-used
ADD Gemfile.tip /opt/myapp/
RUN bundle install


# Add rake and its dependencies
ADD config /opt/myapp/config
ADD Rakefile /opt/myapp/

# Add everything else
# Any change to any file after this point (if not in .dockerignore) will cause the build cache to be busted here
# This includes changes to the Dockerfile itself
# Goal here is to do as little as possible after this entry
ADD . /opt/myapp

ENV PATH /opt/myapp/bin:$PATH
ENTRYPOINT ["/opt/myapp/bin/start.rb"]
CMD ["server"]
