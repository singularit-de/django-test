<p align="center">
  <a href="https://www.singular-it.de/">
    <picture>
      <source media="(prefers-color-scheme: dark)"  srcset="./documents/singular_it_dark.png">
      <source media="(prefers-color-scheme: light)" srcset="./documents/singular_it_light.png">
      <img width="500px" alt="singularIT Logo" src="./documents/singular_it_light.png">
    </picture>    
  </a>
</p>
<p align="center">
  <a href="https://www.singular-it.de/">Website</a> |
  <a href="https://blog.singular-it.de/">Blog</a> |
  <a href="https://www.singular-it.de/team">Team</a>
</p>

## Why?

The official Python images, which are widely used for software development, may not come with all the necessary
dependencies to run Django tests out of the box. This can put a strain on developers who need to set up a CI pipeline,
particularly when trying to use MySQL, MariaDB, or Postgres as services. To work around this issue, developers need to
be aware that they may need to install additional dependencies or configure their CI pipeline in a way that allows these
dependencies to be installed at runtime. This can add extra steps to the development process and may require additional
troubleshooting to ensure that everything is working correctly.

This image is designed to provide you with a convenient and efficient way to work with MySQL databases in CI. The image
comes with a preinstalled MySQL config, which means you can get up and running with your database quickly and easily. In
addition, we've included all the necessary clients, such as mysql-client, to ensure you have everything you need to get
started.

## Compatibility

- 🟢 Supported/Tested
- 🟡 Unknown/Untested
- 🔴 Currently not Supported (open an Issue or Pull request if needed)

| Python version |     |
|----------------|-----|
| `^2.x`         | 🔴  |
| `^3.7.16`      | 🟢  |
| `^3.8.16`      | 🟢  |
| `^3.9.16`      | 🟢  |
| `^3.10.10`     | 🟢  |
| `^3.11.2`      | 🟢  |

| MySQL*️⃣ |     |
|----------|-----|
| `^8.0.0` | 🟢  |
| `<=5.7`  | 🟡  |

| MariaDB*️⃣ |     |
|------------|-----|
| `^11.0.0`  | 🟡  |
| `^10.7.8`  | 🟢  |
| `<10.7.8`  | 🟡  |

| Postgres |     |
|----------|-----|
| `^15.2`  | 🟢  |
| `<15.2`  | 🟡  |

*️⃣ Additional step required see: [Error creating the test database](#error-creating-the-test-database)

## Common issues

### Error creating the test database
`Got an error creating the test database: (1044, "1044 (42000): Access denied for user '<test_user>'@'%' to database 'test_<my_db>'", '42000')`

The MYSQL user is only granted permissions for the MYSQL_DB, which means that Django is unable to create a test database.
To use MySQL and MariaDB with a non-root user, you need to grant privileges to your test user.

`echo "GRANT ALL on *.* to '$MYSQL_USER';"| mysql -u root --password="$MYSQL_ROOT_PASSWORD" -h <host> -p <port>`


## CI Examples

### GitLab CI

```yml
variables:
  MARIADB_USER: test_user
  MARIADB_PASSWORD: password
  MARIADB_ROOT_PASSWORD: root@password
  MARIADB_DATABASE: my_db

django-tests:
  image: orbisk/django-test:3.11
  stage: test
  services:
    - name: mariadb:10
      alias: maria
  script:
    - pip3 install -r requirements.txt
    # The MYSQL user only gets permissions for MYSQL_DB, so Django can't create a test database.
    - echo "GRANT ALL on *.* to '$MARIADB_USER';"| mysql -u root --password="$MARIADB_ROOT_PASSWORD" -h maria
    - python3 manage.py test

```

## Feedback



If you have any problems with or questions about this image, please open an issue on GitHub.
