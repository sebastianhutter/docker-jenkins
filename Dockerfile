FROM jenkins:latest

# install additional packages
USER root
RUN apt-get update && apt-get install -y docker.io
USER jenkins

# install custom plugins
COPY build/plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt