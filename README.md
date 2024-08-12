# rails_fundamental

Welcome to the `develop` branch of **rails_fundamental**. This branch is designed for practicing and exploring Rails concepts and development practices. 

## Ruby and Rails Versions

- **Ruby version**: 3.1.4
- **Rails version**: 7.0.8

## Getting Started

### 1. Clone the Repository

Clone the repository and check out the `develop` branch:

```bash
git clone https://github.com/danhbuidcn/rails_fundamental.git
cd rails_fundamental
git checkout develop
```

### 2. Run the Application
1. **Create .env file**

    ```bash
    cp .env.sample .env
    ```

2. **Start Docker Compose**:

    ```bash
    docker-compose build
    docker-compose up
    ```

3. **Execute Commands in the Web Container**:

    ```bash
    docker-compose exec web bundle exec rails db:create
    docker exec -it rails_fundamental_web bash
    ```

    Inside the container, run:

    ```bash
    bundle install # install gem
    bundle exec rspec # run test rspec
    rubocop -a # modify the file to conform to the style guidelines set in your RuboCop configuration 
    rails assets:precompile # prepare static assets for deployment
    ```

    After installing the package
    ```bash
    yarn add sass@1.77.6 --exact
    rails css:install:bootstrap
    yarn build:css
    ```

    Navigate to `http://localhost:3001` in your browser to view the application.

## Contributing

Feel free to contribute by submitting issues or pull requests.

## Documentation

[Entity Relationship Diagram](https://app.diagrams.net/#G1ZBAc6Cn9PqR2HrCbQEBZ2UnrHbAmbeLf#%7B%22pageId%22%3A%222ca16b54-16f6-2749-3443-fa8db7711227%22%7D)

[Ruby on Rails 7.0 documentation](https://github.com/danhbuidcn/rails_fundamental/tree/rails_guides)

[Ruby on Rails Tutorial](https://www.railstutorial.org/)

[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).

[See more information](https://devdocs.io/rails~7.0)

[ruby wikipedia](https://vi.wikipedia.org/wiki/Ruby_(ng%C3%B4n_ng%E1%BB%AF_l%E1%BA%ADp_tr%C3%ACnh))
