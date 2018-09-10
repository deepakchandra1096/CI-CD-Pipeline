From CentOS-jdk8
RUN mkdir -p/usr/scr/app1
WORKDIR  /usr/src/app1
COPY user-identity-rest-1.0.0.jar /usr/src/app1
RUN yum update
RUN java -version
COPY . /usr/src/app1
EXPOSE 9090 9990
CMD ["/usr/src/app1/bin/standalone.sh", "-c", "standalone-full.xml", "-b", "0.0.0.0"]
