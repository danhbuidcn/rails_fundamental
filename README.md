# Welcome to rails_fundamental

This is a Ruby on Rails application designed with the latest technologies and best practices in mind. **rails_fundamental** serves as a base repository, providing a solid foundation for building various types of applications using the Rails framework, including traditional MVC, APIs, and more.

## Ruby and Rails Versions

- **Ruby version**: 3.1.4
- **Rails version**: 7.0.8

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/danhbuidcn/rails_fundamental.git
cd rails_fundamental
```

### 2. Choose Your Database

By default, this setup uses MySQL. If you'd prefer to use PostgreSQL, follow the instructions below to modify your configuration.

#### MySQL Configuration

- **Docker Compose**: MySQL is already configured in the `docker-compose.yml` file provided. You don't need to make any changes to use MySQL.

#### PostgreSQL Configuration

To switch to PostgreSQL:

1. **Update Gemfile**: Replace the MySQL gem with the PostgreSQL gem.

    ```ruby
    gem 'pg', '~> 1.2'
    ```

2. **Update `database.yml`**:

    Replace the contents of `config/database.yml` with:

    ```yaml
    default: &default
      adapter: postgresql
      encoding: unicode
      pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
      username: <%= ENV['DB_USER'] %>
      password: <%= ENV['DB_PASS'] %>
      host: <%= ENV['DB_HOST'] %>

    development:
      <<: *default
      database: db_development

    test:
      <<: *default
      database: db_test

    production:
      <<: *default
      database: db_production
    ```

3. **Update Docker Compose**:

    Modify the `docker-compose.yml` file to use the PostgreSQL image:

    ```yaml
    version: "3"
    services:
      db:
        image: postgres:13
        environment:
          POSTGRES_PASSWORD: ${DB_PASS}
        ports:
          - "${DB_PORT}:5432"
        volumes:
          - ./postgres_data:/var/lib/postgresql/data
        platform: linux/x86_64

      web:
        build: .
        environment:
          - RAILS_ENV=$RAILS_ENV
          - TZ=Asia/Tokyo
        env_file: .env
        volumes:
          - .:/myapp
          - bundle:/usr/local/bundle
        ports:
          - "${RAILS_PORT}:3000"
        depends_on:
          - db
        stdin_open: true
        tty: true
        command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0' -e ${RAILS_ENV}"

    volumes:
      postgres_data:
      bundle:
    ```

4. **Update github CI**

    ```
    # .github/workflows/main.yml
      postgres:
        image: postgres:13
        env:
          POSTGRES_USER: root
          POSTGRES_PASSWORD: password
        ports: ['5432:5432']
    ```

### 3. Start the Docker Containers

Start the application by running Docker Compose:

```bash
docker-compose up -d
```

### 4. Exec into the Web Container

Once the containers are running, exec into the web container:

```bash
docker-compose exec web bash
```

### 5. Install Dependencies

Inside the container, run:

```bash
bundle install
```

### 6. Configure the Database

Set up your database by running:

```bash
rails db:setup
```

This will create the database, load the schema, and initialize with seed data if available.

### 7. Edit Credentials

To securely manage your application's credentials, run:

```bash
rails credentials:edit
```

### 8. Start the Rails Server

You can start the Rails server inside the container using:

```bash
rails server -b '0.0.0.0'
```

Navigate to `http://localhost:3000` in your browser to view the application.

## Extending the Application

This repository is designed to be a starting point for various types of Rails applications:

### 1. Rails MVC

To extend this base repository for a traditional Rails MVC application:

- **Add Controllers, Models, and Views** as needed using Rails generators.

    ```bash
    rails generate controller Home index
    rails generate model Post title:string content:text
    ```

- **Define Routes** in `config/routes.rb`:

    ```ruby
    Rails.application.routes.draw do
      root 'home#index'
      resources :posts
    end
    ```

### 2. Rails API

To convert this repository into a Rails API application:

1. **API-Only Mode**: Modify `config/application.rb` to enable API mode.

    ```ruby
    module MyApp
      class Application < Rails::Application
        config.api_only = true
      end
    end
    ```

2. **Add API Controllers** using Rails generators.

    ```bash
    rails generate controller Api::V1::Posts
    ```

3. **Update Routes** to reflect API namespaces:

    ```ruby
    Rails.application.routes.draw do
      namespace :api do
        namespace :v1 do
          resources :posts
        end
      end
    end
    ```

4. **Configure CORS** (Cross-Origin Resource Sharing) if your API will be accessed from a different domain.

    Add the `rack-cors` gem to your `Gemfile`:

    ```ruby
    gem 'rack-cors'
    ```

    Configure CORS in `config/initializers/cors.rb`:

    ```ruby
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
    ```

## Contributing

Contributions are welcome! If you have suggestions or improvements, please submit an issue or a pull request.
