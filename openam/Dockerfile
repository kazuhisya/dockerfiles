# vi: set ft=dockerfile :

FROM tomcat:8-jre8

ENV OPENAM_VERSION="13.0.0" \
    CATALINA_OPTS="-Xmx2048m -server" \
    #WAR_URL="http://maven.forgerock.org/repo/releases/org/forgerock/openam/openam-server/" \
    #WAR_NAME="openam-server"
    WAR_URL="https://github.com/OpenRock/OpenAM/releases/download/" \
    WAR_NAME="OpenAM-ServerOnly"

RUN curl -OL "${WAR_URL}/${OPENAM_VERSION}/${WAR_NAME}-${OPENAM_VERSION}.war" && \
    mv ${WAR_NAME}-${OPENAM_VERSION}.war ${CATALINA_HOME}/webapps/openam.war

RUN mkdir -p /root/.openamcfg && \
    touch /root/.openamcfg/AMConfig_usr_local_tomcat_webapps_openam_ && \
    echo "/root/openam" >> /root/.openamcfg/AMConfig_usr_local_tomcat_webapps_openam_

EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
