FROM ubuntu:16.04
WORKDIR /opt

#----------initial steps
RUN apt-get update && apt-get install curl ssh rsync python wget tar -y

#----------ssh configuration
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
    && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
    && chmod 0600 ~/.ssh/authorized_keys \
    && echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config 


#----------jdk steps
RUN apt-get install openjdk-8-jdk -y
RUN { \
        echo '#!/bin/sh'; \
        echo 'set -e'; \
        echo; \
        echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64'; \
    } > /etc/profile.d/java.sh \
    && chmod +x /etc/profile.d/java.sh

#------------------------
ENTRYPOINT service ssh start && tail -f /dev/null
