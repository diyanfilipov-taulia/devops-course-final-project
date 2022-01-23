FROM openjdk:16
#VOLUME /devops-final-project
#ARG JAR_FILE=build/libs/devops-final-project-0.0.1.jar
EXPOSE 10333
RUN mkdir -p /app/
RUN mkdir -p /app/logs/
ADD build/libs/devops-final-project-0.0.1.jar /app/app.jar
ENTRYPOINT ["sh", "-c", "java -Dspring.profiles.active=integration ${JAVA_OPTS} -jar /app/app.jar"]
