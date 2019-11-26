# Start with a base image containing Java runtime
FROM jenkins/jenkins:2.154-alpine

ARG JAR_FILE=build/libs/samedaydelivery-1.jar

ADD ${JAR_FILE} samedaydelivery-1.jar

# Run the jar file

ENTRYPOINT ["java","-jar","/samedaydelivery-1.jar"]




