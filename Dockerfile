<<<<<<< HEAD
FROM eclipse-temurin:11-jdk

WORKDIR /app

COPY target/myapp-0.0.1-SNAPSHOT.jar app.jar

CMD ["java","-jar","app.jar"]
=======
FROM eclipse-temurin:11-jre

WORKDIR /app

COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
>>>>>>> d5b8781 (Fix Dockerfile and Maven build)
