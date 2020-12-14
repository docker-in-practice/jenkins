FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
RUN groupadd -g 1000 jenkins_slave
RUN useradd -d /home/jenkins_slave -s /bin/bash -m jenkins_slave -u 1000 -g jenkins_slave
RUN echo jenkins_slave:jpass | chpasswd
USER root
RUN mkdir /etc/gcrypt
RUN echo all >> /etc/gcrypt/hwf.deny
RUN apt-get update && apt-get install -y openssh-server openjdk-8-jre wget iproute2
RUN mkdir -p /var/run/sshd
CMD ip route | grep "default via" | awk '{print $3}' && /usr/sbin/sshd -D
