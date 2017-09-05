#!/bin/bash
export HOST_IP=$(ip route | grep ^default | awk '{print $3}')
export JENKINS_IP=${JENKINS_IP:-$HOST_IP}
export JENKINS_PORT=${JENKINS_PORT:-8080}
export JENKINS_LABELS=${JENKINS_LABELS:-swarm}
export JENKINS_HOME=${JENKINS_HOME:-$HOME}
echo "Starting up swarm client with args:"
echo "$@"
echo "and env:"
echo "$(env)"
set -x
java -jar \
/home/jenkins_slave/swarm-client-3.4.jar \
    -sslFingerprints '[]' \
    -fsroot "$JENKINS_HOME" \
    -labels "$JENKINS_LABELS" \
    -master http://$JENKINS_IP:$JENKINS_PORT "$@"
