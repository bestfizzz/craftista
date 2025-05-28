# Stage 1: Build the app
FROM maven:3.9.1-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy source code
COPY . .

# Build the app, with tests
RUN mvn package 

# Stage 2: Run the app
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the compiled JAR
COPY --from=builder /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the app
CMD ["java", "-jar", "app.jar"]
