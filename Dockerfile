FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift

WORKDIR /home/jboss
RUN curl -sL https://www.atlassian.com/software/jira/downloads/binary/atlassian-servicedesk-3.9.0.tar.gz -o sd.tar.gz; \
tar xvf sd.tar.gz; mv atlassian-jira-servicedesk*/* .; \
rmdir atlassian-jira-servicedesk*; rm sd.tar.gz

# Define default command.
CMD ["./bin/start-jira.sh", "-fg"]
