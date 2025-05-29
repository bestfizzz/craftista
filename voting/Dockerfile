# === Stage 1: Restore dependencies ===
FROM maven:3.9.1-eclipse-temurin-17 AS dependencies

WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline

# === Stage 2: Test phase ===
FROM dependencies AS test

COPY src ./src

# Run tests only
RUN mvn test

# === Stage 3: Build the app ===
FROM dependencies AS builder

COPY src ./src

# Build without tests (they ran in test stage)
RUN mvn clean package -DskipTests

# === Stage 4: Final runtime image ===
FROM maven:3.9.1-eclipse-temurin-17

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
