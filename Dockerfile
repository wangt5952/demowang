FROM openjdk:8-jre
EXPOSE 8080
ADD ./target/demo-0.0.1-SNAPSHOT.jar /root/demo-0.0.1-SNAPSHOT.jar
ENV TZ "Asia/Shanghai"
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["sh","/usr/local/bin/docker-entrypoint.sh"]