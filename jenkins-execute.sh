#!/bin/sh
BUILD_ID=DONTKILLME
. /etc/profile
# 配置运行参数
export PROJ_PATH=`pwd`
export TOMCAT_APP_PATH=/usr/local/tomcat
# 执行运行脚本
sh $PROJ_PATH/jenkins-study/deploy.sh