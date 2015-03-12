#!/bin/bash
echo "Starting up sshd"
/usr/sbin/sshd -D &
HOST_IP=$(ip route | grep ^default | awk '{print $3}')
DOCKER_IP=${DOCKER_IP:-$HOST_IP}
JENKINS_PORT=${JENKINS_PORT:-8080}
JENKINS_LABELS=${JENKINS_LABELS:-swarm}
JENKINS_HOME=${JENKINS_HOME:-$HOME}
echo "Starting up swarm client with args:"
echo "$@"
echo "and env:"
echo "$(env)"
set -x
java -jar /home/jenkins_slave/swarm-client-1.22-jar-with-dependencies.jar -fsroot "$JENKINS_HOME" -labels "$JENKINS_LABELS" -master http://$DOCKER_IP:$JENKINS_PORT $@
wait
