#!/bin/bash

BUILD_TAG="1.0"
REGISTRY_URL="registry.cn-qingdao.aliyuncs.com"
NAME_SPACE="wangt5952"
APP_NAME="sys"

if [ "$2" != "" ];
    then
    BUILD_TAG="$2"
fi

# build_push_tag
push_tag()
{
    set -e
    # push server
    cd $WORKSPACE
    echo "from wangtao start ======================="
    echo $WORKSPACE
    docker build -t $APP_NAME:$BUILD_TAG .
    docker tag $APP_NAME:$BUILD_TAG $REGISTRY_URL/$NAME_SPACE/$APP_NAME:$BUILD_TAG
    docker push $REGISTRY_URL/$NAME_SPACE/$APP_NAME:$BUILD_TAG
    docker rmi $APP_NAME:$BUILD_TAG
    docker rmi $REGISTRY_URL/$NAME_SPACE/$APP_NAME:$BUILD_TAG
}

if [ "$1" = "pro" ];
    then
    # login
    REGISTRY_URL="registry.cn-qingdao.aliyuncs.com"
    NAME_SPACE="wangt5952"
    docker login --username=wangt5952_2007 $REGISTRY_URL --password=wang2017
    push_tag
    echo '生产环境:dpush.sh pro 1.0'
else
    echo '测试环境参考命令:dpush.sh test test1001'
    echo '生产环境参考命令:dpush.sh prod prod1001'
fi
