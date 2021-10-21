FROM maven:3.8.3-jdk-11-slim AS build

WORKDIR /app

ARG AUDIENCE=abc
ARG DOMAIN=abc
ARG DB_URL=abc
ARG DB_USERNAME=abc
ARG DB_PASSWORD=abc

COPY src /home/app/map-service/src
COPY pom.xml /home/app/map-service

RUN mvn -f /home/app/map-service/pom.xml clean package

FROM openjdk:11-jre-slim

COPY --from=build /home/app/map-service/target/map-service-0.0.1-SNAPSHOT.jar /usr/local/lib/map-service.jar

CMD ["java","-jar","/usr/local/lib/map-service.jar"]
