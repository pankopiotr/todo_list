# Build upon ruby image
FROM ruby:2.5.1

# Install necessary tools
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    nodejs \
  && rm -rf /var/lib/apt/lists/*

# Change default path
WORKDIR /app

# Prepare application
COPY Gemfile* ./
RUN bundle install --retry=3 --jobs=2
COPY . .

# Prepare database
RUN ["rails", "db:setup"]

# Run server
ENTRYPOINT ["rails", "server"]

# Expose port
EXPOSE 3000

