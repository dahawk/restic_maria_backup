#!/bin/sh

if [ ! -z $UID ]
then
    adduser -u $UID -s /bin/sh -D restic
    chown restic:restic .
    user=$UID
    su restic -c 'mysqldump -h $DBHOST -u $DBUSER --password=$DBPASSWORD $DBNAME > $DUMP'
    su restic -c 'restic --no-cache backup $DUMP'
    exit 0
fi

mysqldump -h $DBHOST -u $DBUSER --password=$DBPASSWORD $DBNAME > $DUMP
restic --no-cache backup $DUMP
