FROM jenkins
#COPY jenkins_plugins.txt /tmp/jenkins_plugins.txt
#RUN /usr/local/bin/plugins.sh /tmp/jenkins_plugins.txt
USER root
#RUN rm /tmp/jenkins_plugins.txt
RUN groupadd -g 142 docker
RUN addgroup -a jenkins docker
USER jenkins
