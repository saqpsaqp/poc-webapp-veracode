FROM tomcat:9-jre8

ENV JPDA_ADDRESS=8000
ENV JPDA_TRANSPORT=dt_socket

COPY ./tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml
VOLUME ["/usr/local/tomcat/webapps"]

EXPOSE 8009
EXPOSE 8000
EXPOSE 8080

CMD ["catalina.sh", "jpda", "run"]

