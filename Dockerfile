FROM java

MAINTAINER SequenceIq

# download liquibase
# ADD http://sourceforge.net/projects/liquibase/files/Liquibase%20Core/liquibase-3.6.2-bin.tar.gz/download /tmp/liquibase-3.6.2-bin.tar.gz

# Create a directory for liquibase
# Unpack the distribution
# Get the postgres JDBC driver from http://jdbc.postgresql.org/download.html
# ADD http://jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc41.jar /opt/jdbc_drivers/

# RUN mkdir -p /opt/liquibase \
# mkdir -p /opt/jdbc_drivers \
COPY lib/liquibase-3.6.2-bin.tar.gz /opt/liquibase/liquibase-3.6.2-bin.tar.gz 
COPY lib/postgresql-9.3-1102.jdbc41.jar /opt/jdbc_drivers/postgresql-9.3-1102.jdbc41.jar 
COPY scripts /scripts

RUN tar -xzf /opt/liquibase/liquibase-3.6.2-bin.tar.gz -C /opt/liquibase/;\
chmod +x /opt/liquibase/liquibase;\
ln -s /opt/liquibase/liquibase /usr/local/bin/; \
ln -s /opt/jdbc_drivers/postgresql-9.3-1102.jdbc41.jar /usr/local/bin/; \
chmod -R +x /scripts 

VOLUME ["/changelogs"]

WORKDIR /

ENTRYPOINT ["/bin/bash"]
