# Use the official Tomcat image from the Docker Hub
FROM tomcat:9.0

# Copy your web application WAR file to the webapps directory of Tomcat
COPY dist/E_channeling_System.war /usr/local/tomcat/webapps/

# Expose port 8080 to the outside world
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
