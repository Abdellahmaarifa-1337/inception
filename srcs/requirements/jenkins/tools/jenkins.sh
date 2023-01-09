#!bin/sh

java -Djenkins.install.runSetupWizard=false -jar /usr/share/java/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8080