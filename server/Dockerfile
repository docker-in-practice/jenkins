FROM jenkins/jenkins:2.263.1-lts-centos7
COPY jenkins_plugins.txt /tmp/jenkins_plugins.txt
RUN jenkins-plugin-cli -f /tmp/jenkins_plugins.txt
USER root
RUN rm /tmp/jenkins_plugins.txt
RUN cat /etc/group
RUN groupadd -g 1001 docker
RUN usermod -aG docker jenkins
USER jenkins

