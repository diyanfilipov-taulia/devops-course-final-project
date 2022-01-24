#FROM openjdk:11
##VOLUME /devops-final-project
##ARG JAR_FILE=build/libs/devops-final-project-0.0.1.jar
#RUN mkdir -p /app/
#RUN mkdir -p /app/logs/
#ADD build/libs/devops-final-project-0.0.1.jar /app/app.jar
#EXPOSE 8080
#ENTRYPOINT ["sh", "-c", "java -Dspring.profiles.active=dev ${JAVA_OPTS} -jar /app/app.jar"]


# using multistage docker build
# ref: https://docs.docker.com/develop/develop-images/multistage-build/

# temp container to build using gradle
FROM openjdk:16 as TEMP_BUILD_JAR
WORKDIR /workspace/app

COPY gradle gradle
COPY build.gradle settings.gradle gradlew ./
COPY src src

RUN ./gradlew build -x test

# actual container
FROM openjdk:16
ENV ARTIFACT_NAME=devops-final-project-0.0.1.jar
ENV APP_HOME=/workspace/app

WORKDIR $APP_HOME
COPY --from=TEMP_BUILD_JAR $APP_HOME/build/libs/$ARTIFACT_NAME .
COPY newrelic-agent-7.5.0.jar newrelic.jar
COPY newrelic.yml newrelic.yml


RUN cat newrelic.yml | sed -e "s/<%= license_key %>/${NEWRELIC_KEY}/" > newrelic.yml.new
RUN mv newrelic.yml newrelic.yml.default
RUN mv newrelic.yml.new newrelic.yml

ENV JAVA_OPTS="-Xmx2G -Xms2G -XX:+UseG1GC -javaagent:./newrelic.jar -Dnewrelic.config.file=./newrelic.yml -Dnewrelic.environment=production"
ENTRYPOINT exec java -Dspring.profiles.active=${SPRING_PROFILE} ${JAVA_OPTS} -jar ${ARTIFACT_NAME}
EXPOSE 10333
