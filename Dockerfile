FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift

WORKDIR /home/jboss

RUN curl -sL https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-${VERSION:-6.5.2}.tar.gz -o conf.tar.gz; \
tar xvf conf.tar.gz; mv atlassian-confluence*/* .; \
rmdir atlassian-confluence*; rm conf.tar.gz; chmod 775 *

# COPY conf/server.xml conf/server.xml

RUN sed -i 's/exit 1/exit 0/g' bin/check-java.sh

# Define default command.
CMD ["./bin/start-confluence.sh", "-fg"]
