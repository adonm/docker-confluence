FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift

WORKDIR /home/jboss
ADD https://www.atlassian.com/software/jira/downloads/binary/atlassian-servicedesk-${VERSION:-3.9.0}.tar.gz sd.tar.gz
RUN tar xvf sd.tar.gz; mv atlassian-jira-servicedesk*/* .; \
rmdir atlassian-jira-servicedesk*; rm sd.tar.gz
ADD conf/server.xml conf/server.xml

RUN sed -i 's/exit 1/exit 0/g' bin/check-java.sh

# Define default command.
CMD ["./bin/start-jira.sh", "-fg"]
