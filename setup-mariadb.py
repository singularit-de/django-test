import subprocess
import os


ping = subprocess.run(['mysqladmin', 'ping', '-h', os.environ['MARIADB_HOST'], '-u', os.environ['MARIADB_USER'], '-p' + os.environ['MARIADB_PASSWORD'],
                      capture_output=True)


if ping.returncode == 0:
    if os.environ['MARIADB_ALLOW_EMPTY_PASSWORD'] == 'yes':
        cmd = f'mysql -u {MARIADB_ROOT_USERNAME} -h {MARIADB_HOST} -P {MARIADB_PORT} -e "GRANT ALL on *.* to {MARIADB_USER:-test_user};"'
        subprocess.run(cmd, shell=True)
    else:
        cmd = f'mysql -u {MARIADB_ROOT_USERNAME} -p{MARIADB_ROOT_PASSWORD} -h {MARIADB_HOST} -P {MARIADB_PORT} -e "GRANT ALL on *.* to {MARIADB_USER:-test_user};"'
        subprocess.run(cmd, shell=True)
else:
    print('MariaDB-Server is not available. Skipping...')
