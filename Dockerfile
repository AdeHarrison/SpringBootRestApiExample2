FROM anapsix/alpine-java
WORKDIR /
ADD target/SpringBootRestApiExample2-1.0.0.jar SpringBootRestApiExample2.jar
EXPOSE 8081
ENTRYPOINT ["java"]
CMD ["-jar", "SpringBootRestApiExample2.jar"]
