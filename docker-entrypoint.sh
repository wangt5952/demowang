#!/bin/sh
if [ -n "$ENV" ] ; then
PROFILES_ACTIVE=$ENV
else
PROFILES_ACTIVE="dev"
fi
echo '环境---------------'
echo ${PROFILES_ACTIVE}
java -jar /root/demo-1.0.jar --spring.profiles.active=${PROFILES_ACTIVE} --server.port=8080 $JAVA_OPTS