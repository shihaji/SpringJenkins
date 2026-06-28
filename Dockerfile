FROM eclipse-temurin:25-jre
EXPOSE 8086
ADD target/springjenkins.jar springjenkins.jar
ENTRYPOINT ["java","-jar","springjenkins.jar"]