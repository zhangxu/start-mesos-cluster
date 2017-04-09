FROM oraclelinux:7-slim

ADD ./jdk-8u121-linux-x64.tar.gz /opt/
ADD ./apache-maven-3.3.9-bin.tar.gz /opt/
ADD ./mesos-1.2.0.tar.gz /opt/

RUN mv /opt/jdk* /opt/jdk && mv /opt/apache-maven-* /opt/maven

RUN echo "PATH=/opt/jdk/bin:/opt/maven/bin:\$PATH" > /etc/profile.d/zkpath.sh

ENTRYPOINT ["bash", "-li"]