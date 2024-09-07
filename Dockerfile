FROM maven
WORKDIR /usr/src/app
COPY . .
WORKDIR /usr/src/app
RUN mvn clean install -DskipTests
FROM openjdk:8
WORKDIR /usr/src/app
COPY --from=0 /usr/src/app/target/catalog-search-service.jar ./
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-jar", "./catalog-search-service.jar"]