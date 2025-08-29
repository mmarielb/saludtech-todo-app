FROM ruby:3.2.2
WORKDIR /app
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential
COPY Gemfile* ./
RUN gem install bundler && bundle install --jobs 4
COPY . .
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
