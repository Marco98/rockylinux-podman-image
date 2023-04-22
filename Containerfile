FROM docker.io/rockylinux:9.1

RUN dnf install -y systemd podman && \
  dnf clean all && \
  rm -rf /var/cache /var/log/dnf* /var/log/yum.*

COPY containers.conf storage.conf /etc/containers/

RUN mkdir -p /var/lib/shared

VOLUME /var/lib/containers

CMD [ "/usr/sbin/init" ]
