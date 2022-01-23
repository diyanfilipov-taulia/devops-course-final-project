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

EXPOSE 8080
ENTRYPOINT exec java -Dspring.profiles.active=integration -jar ${ARTIFACT_NAME}