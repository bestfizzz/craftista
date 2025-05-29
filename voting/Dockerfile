# Stage 1: Build the app
FROM maven:3.9.1-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy source code
COPY . .

# Build the app, skip tests
RUN mvn package -DskipTests

# Stage 2: test the app
FROM builder AS test

COPY src ./src

# Run tests only
RUN mvn test

# Stage 3: Run the app
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the compiled JAR
COPY --from=builder /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the app
CMD ["java", "-jar", "app.jar"]
