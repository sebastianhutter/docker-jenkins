# docker-jenkins

The docker image is based on the official jenkins image - https://hub.docker.com/_/jenkins/

## docker build
I am using the jenkins image to build and publish docker containers with the CloudBees Docker Build and Publish plugin.
https://wiki.jenkins-ci.org/display/JENKINS/CloudBees+Docker+Build+and+Publish+plugin

To make the docker build command work you need to mount the docker.socket to the container.

```
-v /var/run/docker.sock:/var/run/docker.sock
```

In addition you need to run the container as root user (USER root) - or any user who is privileged to access the docker.sock
You can overwrite the default user accout 'jenkins' by specifing --user on the commmand line.
```
--user=root
```

### Example command line 
This starts the jenkins container with the user root and with the docker sock.
```
docker run --publish=8080:8080 --publish=50000:50000 -v /mnt/docker/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -t --user=root --name jenkins sebastianhutter/jenkins:latest
```