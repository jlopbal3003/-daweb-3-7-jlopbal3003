# Base image
FROM jboss/wildfly:19.1.0.Final

# Label (Maintainer is deprecated)
LABEL "jlopbal3003" "joseantonio.lopez.alumnado@iesalandalus.eu"

# Create user admin with password admin123
RUN /opt/jboss/wildfly/bin/add-user.sh admin admin123 --silent

# Add custom configuration file
# ADD standalone.xml /opt/jboss/wildfly/standalone/configuration/

# Add example.war to deployments
ADD node-info.war /opt/jboss/wildfly/standalone/deployments/
ADD SampleWebApp.war /opt/jboss/wildfly/standalone/deployments/

# JBoss ports
EXPOSE 8080 9990 8009

# Run
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]