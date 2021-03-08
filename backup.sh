#!/bin/bash

mariadb-dump -h $DBHOST -u $DBUSER --password=$DBPASSWORD $DBNAME > $DUMP

/opt/restic backup $DUMP
