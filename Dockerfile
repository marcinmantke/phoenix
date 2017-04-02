FROM elixir:latest

ENV APP_ROOT /app

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt-get update -qq && \
    apt-get install -y build-essential nodejs cmake


# Install hex
RUN mix local.hex --force

# Install the Phoenix framework itself
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

WORKDIR $APP_ROOT

ADD . $APP_ROOT
