# ┌─────────────── build stage ───────────────┐
FROM maven:3-eclipse-temurin-21-alpine AS build
WORKDIR /app

# 1) Pre-download dependencies to leverage layer cache
COPY pom.xml .
RUN mvn dependency:go-offline

# 2) Compile & package (skipping tests for speed)
COPY src ./src
RUN mvn clean package -DskipTests

# └─────────────── runtime stage ───────────────┘
FROM eclipse-temurin:21-jre-alpine AS runtime
WORKDIR /app

# 3) Copy the fat-jar from the build stage
COPY --from=build /app/target/docker-java-test-1.0-SNAPSHOT.jar ./app.jar

# 4) Launch the application
ENTRYPOINT ["java", "-jar", "app.jar"]
