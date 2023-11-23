FROM jenkins/jenkins:lts-jdk17
USER root

RUN apt update && \
    apt install -y --no-install-recommends gnupg curl ca-certificates apt-transport-https

RUN apt install -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Establecer variables de entorno para Gradle
ENV GRADLE_VERSION 8.2
ENV GRADLE_HOME /opt/gradle
ENV GRADLE_USER_HOME /gradle_cache
ENV LOCAL_USER squintero

# Descargar y descomprimir Gradle
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp && \
    unzip -d /opt /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    ln -s /opt/gradle-${GRADLE_VERSION} /opt/gradle && \
    rm /tmp/gradle-${GRADLE_VERSION}-bin.zip

# Añadir Gradle al PATH
ENV PATH $PATH:$GRADLE_HOME/bin

# Crear un usuario con un UID específico
RUN useradd -u 1000 ${LOCAL_USER}

# Cambiar al usuario no root
USER ${LOCAL_USER}