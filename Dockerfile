FROM tomcat:9.0

COPY Global_Bank.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
