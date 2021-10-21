FROM openjdk:latest

WORKDIR /app

# Copy required project files into container
COPY src /home/app/map-service/src
COPY pom.xml /home/app/map-service

# Set enivornment variables
ARG AUDIENCE=abc
ARG DOMAIN=abc
ARG DB_URL=abc
ARG DB_USERNAME=abc
ARG DB_PASSWORD=abc

# Build for production
RUN mvn --batch-mode --update-snapshots verify

FROM openjdk:11-jre-slim

COPY --from=build /home/app/map-service/target/map-service-0.0.1-SNAPSHOT.jar map-service.jar

# Start 
CMD ["java","-jar","map-service.jar"]
