FROM mesos:1.2.0-cut-1

ADD ./marathon-1.4.1.tgz /opt/

RUN mv /opt/marathon* /opt/marathon

RUN echo "PATH=/opt/marathon/bin:\$PATH" >> /etc/profile.d/path.sh
