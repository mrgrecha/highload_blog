# Highload blog

It is a test task for job application.

Requirments:
* Ruby 2.6.3
* PostgreSQL 11.2


## Installation
```
git clone https://github.com/mrgrecha/highload_blog.git
cd highload_blog

cp config/database.yml.example config/database.yml
```
Add your database username and password in config/database.yml
```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```
In db/seed.rb you can find next constants. Feel free to change them to check performance. Changing INCREASE_COEFFICIENT is the easiest way to increase the number of records several times.
```ruby
INCREASE_COEFFICIENT = 1
COUNT_OF_USERS = 100 * INCREASE_COEFFICIENT
COUNT_OF_POSTS = 200_000 * INCREASE_COEFFICIENT
COUNT_OF_IPS = 50 * INCREASE_COEFFICIENT
AVERAGE_NUMBER_OF_RATINGS_PER_POST = 5
```

Running seeds can take some time. Please wait until 'Done. Seeds are created' will appear.
Then run in console:
```
whenever --update-crontab --set environment='development'
```
It schedule cron jobs for refreshing materialized views. Please notice that it will work in development mode. It runs every minute necessary rake tasks for refreshing materialized views. Of course it's been done for easier testing locally. You can change it in config/schedule.rb and rerun script above.
Then run server:
```
bundle exec rails server
```
## Making requests
For making requests I decided to use rake tasks. All of them can be found in lib/tasks/requests.rb. You will see response and necessary time for each request. If time is green it means that request took less than 100 ms. Otherwise it's red and took >100ms.
### Create a post.
You can pass next variables: AUTHOR(author login), IP_ADDRESS, POST_TITLE and POST_BODY. If you skip any of these variables it will take or generate random data.
```
bundle exec rake requests:create_post AUTHOR=LOGIN_OF_AUTHOR IP_ADDRESS=127.0.0.1 POST_TITLE=POST_TITLE POST_BODY=POST_BODY
```
or running without params
```
bundle exec rake requests:create_post
```
### Rate the post.
You can pass next variables: POST_ID and RATING_VALUE(1-5). If you skip any of these variables it will take or generate random data.
```
bundle exec rake requests:rate_post POST_ID=1 RATING_VALUE=4
```
or running without params
```
bundle exec rake requests:rate_post
```
### Get top N the best rating posts.
You can pass next variables: N(number of records). It uses 20 as default number of records.
```
bundle exec rake requests:get_top_posts N=100
```
or running without params
```
bundle exec rake requests:get_top_posts
```
### Get all not unique ip addresses with authors' logins.
You cannot pass any variables there. Just run:
```
bundle exec rake requests:get_not_uniques_ip_addresses
```

## Testing
For testing run:
```
bundle exec rspec spec
```
