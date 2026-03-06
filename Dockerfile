FROM eclipse-temurin:11-jdk

WORKDIR /app

COPY target/myapp-0.0.1-SNAPSHOT.jar app.jar

CMD ["java","-jar","app.jar"]
