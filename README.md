# Ruby on Rails Tutorial sample application
This is the sample application for Ruby on Rails Tutorial: Learn Web Development with Rails by [Danh Bui](https://github.com/danhbuidcn).

Based on [Ruby on Rails Tutorial](https://www.railstutorial.org/)

For more information, see the [*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).

## Getting started

To get started with the app, clone the repo and then run:
```
$ doker-composer build
$ docker-composer up
```

Next, run the test suite to verify that everything is working correctly:
```
$ docker exec -it rails_fundamental_web bash
$ bundle exec rspec
$ rubocop -a
```
