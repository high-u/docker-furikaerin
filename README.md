# docker-furikaerin

## Usage

```
git clone https://github.com/high-u/docker-furikaerin.git
cd docker-furikaerin

vim database.yml

docker-compose build 
docker-compose up -d
docker-compose run furikaerin bundle exec rails db:setup
```

