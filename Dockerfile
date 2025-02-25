# Étape 1 : Construire l'application
FROM maven:3.8.5-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Étape 2 : Exécuter l'application
FROM openjdk:17
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8089
CMD ["java", "-jar", "app.jar"]
