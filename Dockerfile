#FROM openjdk:17
#EXPOSE 20100
#ADD build/libs/dockerapp.jar dockerapp.jar
#ENTRYPOINT ["java", "-jar", "/dockerapp.jar"]


FROM gradle:8.5-jdk AS builder
RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
RUN ./gradlew clean build


FROM openjdk:17.0.1-jdk-slim AS run
COPY --from=builder /app/source/build/libs/dockerapp.jar /app/dockerapp.jar
EXPOSE 20100
ENTRYPOINT ["java", "-jar", "/app/dockerapp.jar"]
