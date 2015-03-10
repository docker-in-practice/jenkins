FROM debian
RUN useradd -d /home/jenkins_slave
RUN echo jenkins_slave:jpass | chpasswd
RUN apt-get update && apt-get install -y openssh-server openjdk-7-jre docker.io
CMD ["/etc/init.d/ssh","start"]
