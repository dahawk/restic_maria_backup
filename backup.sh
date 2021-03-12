#!/bin/bash

mysqldump -h $DBHOST -u $DBUSER --password=$DBPASSWORD $DBNAME > $DUMP

/opt/restic backup $DUMP
