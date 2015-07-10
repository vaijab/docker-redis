FROM fedora:22

RUN dnf upgrade -y && dnf clean all
RUN dnf --releasever rawhide install -y --nogpgcheck redis-3.0.2-2.fc23.x86_64 hostname && dnf --releasever rawhide clean all

COPY run.sh /run.sh
COPY redis.conf /etc/redis.conf
COPY redis-sentinel.conf /etc/redis-sentinel.conf

CMD /usr/bin/bash -c "/run.sh ${SENTINEL_HOST} ${SENTINEL_PORT}"
