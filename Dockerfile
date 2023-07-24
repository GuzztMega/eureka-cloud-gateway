FROM maven:3.8.5-openjdk-11 as build
WORKDIR /app
COPY . .
RUN mvn package -DskipTests

FROM openjdk:11
WORKDIR /app
COPY --from=build ./app/target/*.jar ./app.jar

ARG EUREKA_USER=eureka-microservices-admin
ARG EUREKA_PASS=akeruesecivresorcimnimda
ARG EUREKA_SERVER=127.0.0.1
ARG KEYCLOAK_SERVER=127.0.0.1
ARG KEYCLOAK_PORT=8090

ENTRYPOINT java -jar app.jar