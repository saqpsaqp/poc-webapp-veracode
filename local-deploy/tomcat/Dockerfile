FROM tomcat:9-jre8

ENV JPDA_ADDRESS=8000
ENV JPDA_TRANSPORT=dt_socket

# Crear un usuario con un UID específico
RUN useradd -u 1000 ${LOCAL_USER}

# Cambiar al usuario no root
USER ${LOCAL_USER}

COPY ./tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml
VOLUME ["/usr/local/tomcat/webapps"]
VOLUME ["/usr/local/tomcat/logs"]

EXPOSE 8009
EXPOSE 8000
EXPOSE 8080

CMD ["catalina.sh", "jpda", "run"]

