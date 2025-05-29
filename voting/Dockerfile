FROM maven:3.9.1-eclipse-temurin-17 AS builder
WORKDIR /app

COPY . .

RUN mvn package -DskipTests

FROM maven:3.9.1-eclipse-temurin-17 AS test
WORKDIR /app

COPY . .

RUN mvn test

FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
