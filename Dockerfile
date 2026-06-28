FROM eclipse-temurin:25-jre
EXPOSE 8086
ADD target/springjenkins.jar springjenkins.jar
RUN apt-get update && apt-get install -y curl
ENTRYPOINT ["java","-jar","springjenkins.jar"]