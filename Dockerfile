#FROM maven:3.8.1-jdk-11 AS build
#COPY src /usr/src/app/src
#COPY pom.xml /usr/src/app
#RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:11
COPY ./target/*.jar /usr/app/target/app.jar
EXPOSE 8080
WORKDIR /usr/app/target/
RUN ls -a
ENTRYPOINT ["java","-Dspring.profiles.active=mysql", "-jar", "app.jar"]
