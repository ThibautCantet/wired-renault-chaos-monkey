# Step 1: Build the application
# Use Maven with OpenJDK 17 to build the application
FROM maven:3.8.4-openjdk-17-slim AS build

# Copy the project files into the container
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Package the application
#RUN mvn --version
RUN mvn clean package -DskipTests

# Step 2: Create the final Docker image
# Use OpenJDK 17 slim for the runtime image
FROM openjdk:17-slim

# Copy the built JAR file from the build stage
COPY --from=build /app/target/chaos-monkey-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the port the application runs on
EXPOSE 8084

# Define the container's entry point as the Spring Boot application
ENTRYPOINT ["java","-jar","/app/app.jar"]
