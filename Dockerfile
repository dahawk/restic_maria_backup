FROM alpine:3.13

RUN apk --no-cache update && \
    apk --no-cache add mariadb-client openssh-client bzip2 restic && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

WORKDIR /opt

COPY ./backup.sh .

CMD ["/opt/backup.sh"]
