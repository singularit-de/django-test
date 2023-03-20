import subprocess
import os


ping = subprocess.run(['mysqladmin', 'ping', '-h', os.environ['MYSQL_HOST'], '-u', os.environ['MYSQL_USER'], '-p' + os.environ['MYSQL_PASSWORD'],
                      capture_output=True)


if ping.returncode == 0:
    if os.environ['MYSQL_ALLOW_EMPTY_PASSWORD'] == 'yes':
        cmd = f'mysql -u {MYSQL_ROOT_USERNAME} -h {MYSQL_HOST} -P {MYSQL_PORT} -e "GRANT ALL on *.* to {MYSQL_USER:-test_user};"'
        subprocess.run(cmd, shell=True)
    else:
        cmd = f'mysql -u {MYSQL_ROOT_USERNAME} -p{MYSQL_ROOT_PASSWORD} -h {MYSQL_HOST} -P {MYSQL_PORT} -e "GRANT ALL on *.* to {MYSQL_USER:-test_user};"'
        subprocess.run(cmd, shell=True)
else:
    print('MySQL-Server is not available. Skipping...')

