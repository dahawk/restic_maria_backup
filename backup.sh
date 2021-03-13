#!/bin/sh

if [ ! -z $UID ]
then
    adduser -u $UID -s /bin/sh -D -H restic
    chown restic:restic .
    user = $UID
    su -u restic -c 'mysqldump -h $DBHOST -u $DBUSER --password=$DBPASSWORD $DBNAME > $DUMP'
    su -u restic -c 'restic backup $DUMP'
    exit 0
fi

mysqldump -h $DBHOST -u $DBUSER --password=$DBPASSWORD $DBNAME > $DUMP
restic backup $DUMP
