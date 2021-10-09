FROM maven:3.5-jdk-8-alpine AS build
WORKDIR /code
RUN mkdir -p /root/.m2
COPY settings.xml /root/.m2/settings.xml
COPY pom.xml /code/pom.xml

RUN mvn dependency:resolve
RUN mvn verify

# Adding source, compile and package into a fat jar
COPY ["src/main", "/code/src/main"]
RUN mvn package

FROM openjdk:8-jre-alpine

COPY --from=build /code/target/app.jar /home/app/app.jar
# 声明服务运行在8088端口
EXPOSE 9999
CMD ["java","-jar","/home/app/app.jar"]