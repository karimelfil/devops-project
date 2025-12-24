#!/bin/bash
echo "🚀 Starting Jenkins CI Server..."
docker-compose -f docker-compose.jenkins.yml down 2>/dev/null
docker-compose -f docker-compose.jenkins.yml up -d

echo "Waiting for Jenkins to start..."
sleep 30

echo "Getting initial admin password..."
JENKINS_PASSWORD=$(docker exec jenkins-ci cat /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null || echo "Check container logs")

PUBLIC_IP=$(curl -s ifconfig.me)
echo "========================================"
echo "Jenkins is running!"
echo "URL: http://${PUBLIC_IP}:8080"
echo "OR: http://localhost:8080"
echo "Initial password: $JENKINS_PASSWORD"
echo "========================================"
