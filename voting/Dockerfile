# === Stage 1: Build and test the app ===
FROM maven:3.9.1-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml and dependencies first to leverage Docker layer caching
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build and run tests
RUN mvn clean package

# === Stage 2: Final image to run the app ===
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the compiled jar from the builder stage
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
