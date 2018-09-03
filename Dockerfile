FROM ruby:2.5.1

RUN apt-get update
RUN curl -SL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y --no-install-recommends nodejs postgresql-client 
RUN rm -rf /var/lib/apt/lists/*
RUN npm install -g yarn

RUN mkdir /myapp
WORKDIR /myapp
RUN git clone https://github.com/ppworks/furikaerin.git
COPY database.yml /myapp/furikaerin/config/database.yml
WORKDIR /myapp/furikaerin
RUN yarn install
RUN bundle install --without test production

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s"]
