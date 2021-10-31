FROM maven:3-jdk-11-slim

WORKDIR /app

# Copy required project files
COPY src /app/src
COPY pom.xml /app

# Set enivornment variables
ARG AUDIENCE=abc
ARG DOMAIN=abc
ARG DB_URL=abc
ARG DB_USERNAME=abc
ARG DB_PASSWORD=abc

# Build for production
RUN mvn -DAUDIENCE=AUDIENCE -DDOMAIN=DOMAIN -DDB_URL=DB_URL -DDB_USERNAME=DB_USERNAME -DDB_PASSWORD=DB_PASSWORD --update-snapshots package

# Start
CMD ["java","-jar","/app/target/map-service-0.0.1-SNAPSHOT.jar"]
