FROM maven:latest-jdk-11-slim AS build

COPY src /home/map-service/src
COPY pom.xml /home/map-service

ARG AUDIENCE=abc
ARG DOMAIN=abc

RUN mvn -f /home/map-service/pom.xml clean package

FROM openjdk:11-jre-slim

COPY --from=build /home/map-service/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar

ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
