import subprocess
import os

if os.environ.get("MYSQL_HOST",None):
    print('MySQL-Server setup...')
    if os.environ['MYSQL_ALLOW_EMPTY_PASSWORD'] == 'yes':
        cmd = f'mysql -u {MYSQL_ROOT_USERNAME} -h {MYSQL_HOST} -P {MYSQL_PORT} -e "GRANT ALL on *.* to {MYSQL_USER:-test_user};"'
        subprocess.run(cmd, shell=True)
    else:
        cmd = f'mysql -u {MYSQL_ROOT_USERNAME} -p{MYSQL_ROOT_PASSWORD} -h {MYSQL_HOST} -P {MYSQL_PORT} -e "GRANT ALL on *.* to {MYSQL_USER:-test_user};"'
        subprocess.run(cmd, shell=True)
else:
    print('MySQL-Server is not available. Skipping...')

