FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-client curl openssh-client bzip2 && \
    rm -rf /var/lib/apt/lists/* /var/cache/debconf/* /var/lib/dpkg/status* && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

WORKDIR /opt

COPY ./backup.sh .

RUN curl -LO https://github.com/restic/restic/releases/download/v0.12.0/restic_0.12.0_linux_amd64.bz2 && bzip2 -d restic_0.12.0_linux_amd64.bz2 && mv restic_0.12.0_linux_amd64 restic && chmod +x restic backup.sh

CMD ["/opt/backup.sh"]
