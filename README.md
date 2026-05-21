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

## Features

- 🐍 Python 3.7 - 3.14
- ⚡️ [`uv`](https://github.com/astral-sh/uv) preinstalled
- 🏗️ Build dependencies preinstalled
- 🔄 CI/CD ready
- 🐘 Postgres support
- 🦭 MariaDB support
- 🐬 MySQL support
- 🏢 MSSQL support (beta)

## Compatibility

- 🟢 Supported/Tested
- 🟡 Unknown/Untested
- 🟠 Beta/Experimental (please share your experiences)
- 🔴 Currently not Supported (open an Issue or Pull request if needed)

| Python version |                        | uv preinstalled |
|----------------|------------------------|:----------------|
| `^3.14.3`      | 🟢                     | 🟢              |
| `^3.13.0`      | 🟢                     | 🟢              |
| `^3.12.4`      | 🟢                     | 🟢 (`^3.12.7`)  |
| `^3.11.2`      | 🟢                     | 🟢 (`^3.11.10`) |
| `^3.10.10`     | 🟢                     | 🟢 (`^3.10.15`) |
| `^3.9.16`      | 🟢                     | 🟢 (`^3.9.20`)  |
| `^3.8.16`      | 🟢                     | 🟢 (`^3.8.20`)  |
| `^3.7.16`      | 🟡 ([see](#python-37)) | 🔴              |
| `^2.x`         | 🔴                     | 🔴              |

| MySQL*️⃣ |    |
|----------|----|
| `^9.0.0` | 🟢 |
| `^8.0.0` | 🟢 |
| `<=5.7`  | 🟡 |

| MariaDB*️⃣ |    |
|------------|----|
| `^11.0.0`  | 🟢 |
| `^10.7.8`  | 🟢 |
| `<10.7.8`  | 🟡 |

| Postgres |    |
|----------|----|
| `^17.0`  | 🟢 |
| `^16.0`  | 🟢 |
| `^15.2`  | 🟢 |
| `<15.2`  | 🟡 |

| MSSQL ([see](#mssql-beta)) |    |
|----------------------------|----|
| `>=2022`                   | 🟠 |
| `^2019-CU23-ubuntu-20.04`  | 🟢 |
| `<=2017`                   | 🟠 |

*️⃣ Additional step required see: [Error creating the test database](#error-creating-the-test-database)

## Common issues

### Error creating the test database

`Got an error creating the test database: (1044, "1044 (42000): Access denied for user '<test_user>'@'%' to database 'test_<my_db>'", '42000')`

The MYSQL user is only granted permissions for the MYSQL_DB, which means that Django is unable to create a test
database.
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

## MSSQL Beta

⚠️ The MSSQL support is currently in beta. If you have any problems with or questions about this image, please open an
issue on GitHub.

MSSQL is currently only supported/tested with the following versions:

- [`^mssql-server-linux:2019-CU23-ubuntu-20.04`](https://hub.docker.com/_/microsoft-mssql-server)
- [`mssql-django===1.3`](https://pypi.org/project/mssql-django/)
- [`Microsoft ODBC Driver 17 for SQL Server` &
  `Microsoft ODBC Driver 18 for SQL Server`](https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=debian18-install%2Calpine17-install%2Cdebian8-install%2Credhat7-13-install%2Crhel7-offline)

### Self-signed certificates with ODBC Driver 18

ODBC Driver 18 enables encryption by default and validates the server certificate.
The official `mcr.microsoft.com/mssql/server` image ships with a self-signed cert,
so connections fail with `SSL Provider: certificate verify failed: self-signed certificate`.

For CI/test usage, pass `TrustServerCertificate=yes` via the Django database `OPTIONS`:

```python
DATABASES = {
    "mssql": {
        "ENGINE": "mssql",
        # ...
        "OPTIONS": {
            "extra_params": "TrustServerCertificate=yes",
        },
    },
}
```

Alternatively, set `Encrypt=no` to disable TLS entirely (matches Driver 17's old default).
Do **not** use either option in production — provide a CA-signed certificate instead.

## Limitations

### Python 3.7

Python 3.7 is not covered by our CI/CD tests anymore. This means that we can't guarantee that the image will work as
expected with Python 3.7. The reason is that packages like `mssql-django` dropped support for Python 3.7, so we can't
test it anymore. 