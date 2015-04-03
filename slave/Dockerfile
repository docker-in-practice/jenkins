FROM ubuntu
RUN groupadd -g 1000 jenkins_slave
RUN useradd -d /home/jenkins_slave -s /bin/bash -m jenkins_slave -u 1000 -g jenkins_slave
RUN echo jenkins_slave:jpass | chpasswd
RUN apt-get update && apt-get install -y openssh-server openjdk-7-jre docker.io wget
RUN mkdir -p /var/run/sshd
CMD ip route | grep "default via" | awk '{print $3}' && /usr/sbin/sshd -D

