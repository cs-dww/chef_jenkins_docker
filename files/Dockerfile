FROM centos AS builder
RUN yum install -y git maven java-1.8.0-openjdk-devel
#RUN git clone https://github.com/vaadin/addressbook.git
RUN git clone https://github.com/devopstrainers1/addressbook.git
WORKDIR addressbook
RUN mvn package
RUN mv target/addressbook-2.0.war target/addressbook.war

FROM tomcat:9.0
#RUN apt-get install openjdk-8-jdk
WORKDIR /usr/local/tomcat
COPY --from=builder /addressbook/target/addressbook.war webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]

