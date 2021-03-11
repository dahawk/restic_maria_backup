Take the mariadb image, add restic to it and finish it off with a bash script and some env variables and you get a nice way to back up arbitrary mariadb databases to a restic repo

## Config

Configuration for DB and Restic can be achieved through these environment variables:

- DBHOST  
Hostname of the MariaDB. This corresponds to the container name of the DB-Container
- DBUSER
- DBPASSWORD
- DBNAME
- DUMP  
File name of the mysql dump file. 

There are no default values behind these variables, you have to provide all  of them!

## Other stuff

- This image has ssh/sftp installed to make use of sftp as repository targets. In order to make headless, Host Key Verification is disabled. **Only use ssh/sftp servers that you really trust**

- This image is published on docker hub under `hochri/restic_maria_backup`