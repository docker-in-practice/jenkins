#!/bin/bash
echo "Starting up sshd"
mkdir -p /var/run/sshd
/usr/sbin/sshd -D
echo "Starting up swarm client with args: $@"
java -jar /home/jenkins_slave/swarm-client-1.22-jar-with-dependencies.jar $@
sleep infinity
