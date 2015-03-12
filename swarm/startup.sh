#!/bin/bash
echo "Starting up sshd"
mkdir -p /var/run/sshd
/usr/sbin/sshd -D
echo "Starting up swarm client with args: $@"
HOST_IP=$(ip route | ^default | awk '{print $3}')
DOCKER_IP=${DOCKER_IP:-$HOST_IP}
JENKINS_PORT=${JENKINS_PORT:-8080}
JENKINS_LABELS=${JENKINS_LABELS:-""}
set -x
java -jar /home/jenkins_slave/swarm-client-1.22-jar-with-dependencies.jar -labels "$JENKINS_LABELS" -master http://$DOCKER_IP:$JENKINS_PORT $@
sleep infinity
