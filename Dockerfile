FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/devops-demo.jar app.jar
ENTRYPOINT ["java", "-jar","app.jar"]
EXPOSE 2222