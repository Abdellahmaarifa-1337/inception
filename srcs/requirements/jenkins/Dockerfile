FROM debian:buster
RUN apt update -y 
RUN apt install software-properties-common -y
RUN apt-add-repository 'deb http://security.debian.org/debian-security stretch/updates main'
RUN apt update -y 
RUN apt install default-jdk -y
RUN apt install wget -y
RUN apt install gnupg -y

# Add the Jenkins repository and install Jenkins
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
RUN echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list
RUN apt update && apt install -y jenkins
COPY ./tools/jenkins.sh /usr/bin/jenkins.sh
RUN chmod +x /usr/bin/jenkins.sh
RUN chmod +x -R /usr/share/jenkins/
RUN apt install git -y
#RUN chmod 777 /var/www/html
CMD ["/usr/bin/jenkins.sh"]