FROM ruby:2.2.2
MAINTAINER "Kouhei Fujigaya" <kouhei.fujigaya@gamil.com>

RUN apt-get update \
      && apt-get install -y nodejs mysql-client --no-install-recommends \
      && rm -rf /var/lib/apt/lists/*

ENV RAILS_ROOT /rails_docker_sample
WORKDIR $RAILS_ROOT

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
# ADD . $RAILS_ROOT

CMD ["bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
