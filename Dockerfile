FROM oraclelinux:7-slim

ENTRYPOINT ["/bin/bash", "-l", "-i"]

ADD ./jdk-8u121-linux-x64.tar.gz /opt/
ADD ./apache-maven-3.3.9-bin.tar.gz /opt/
ADD ./mesos-1.2.0.tar.gz /opt/

RUN mv /opt/jdk* /opt/jdk && mv /opt/apache-maven-* /opt/maven

RUN echo "PATH=/opt/jdk/bin:/opt/maven/bin:\$PATH" > /etc/profile.d/path.sh && \
  echo "JAVA_HOME=/opt/jdk" >> /etc/profile.d/path.sh

RUN yum update -y && \
    yum-config-manager --enable ol7_optional_latest && \
    yum install -y gcc-c++ make patch autoconf libtool zlib-devel apr-devel libcurl-devel \
    cyrus-sasl-devel cyrus-sasl-md5 subversion-devel python-devel && \
    yum install -y tar gzip && \
    yum clean all