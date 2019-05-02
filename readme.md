# Quick Blog Example

This is an example blog application showcasing how to use Quick.

## Getting Started

You need a datasource named `quick_blog` to use this example.  By default, it uses a Postgres database.
Feel free to use a different database, Quick will AutoDiscover it for you. (It will need a reinit after changing the datasource.)

If you want to get a datasource running quickly, get a Postgres database up and running with Docker:
```
docker run -d \
    --name quick_blog \
    -p 5432:5432 \
    -e POSTGRES_USER=quick_blog \
    -e POSTGRES_PASSWORD=quick_blog \
    -e POSTGRES_DB=quick_blog \
    postgres:11.2
```

Make sure to fill in your `.env` file.  If you are using the docker datasource as above, it should look like this:
```
DB_CONNECTIONSTRING=jdbc:postgresql://localhost:5432/quick_blog
DB_HOST=localhost
DB_PORT=5432
DB_USER=quick_blog
DB_DATABASE=quick_blog
DB_PASSWORD=quick_blog
DB_CLASS=org.postgresql.Driver

TEST_DB_CONNECTIONSTRING=jdbc:postgresql://localhost:5432/quick_blog
TEST_DB_HOST=localhost
TEST_DB_PORT=5432
TEST_DB_USER=quick_blog
TEST_DB_DATABASE=quick_blog
TEST_DB_PASSWORD=quick_blog
TEST_DB_CLASS=org.postgresql.Driver
```
